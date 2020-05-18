/*
 * Copyright 2015 Fetch Robotics Inc
 * Author: Michael Ferguson
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <controller.h>

#include <angles/angles.h>

#include <tf/transform_listener.h>

#include <algorithm>
#include <list>
#include <vector>
#include <cmath>

BaseController::BaseController(ros::NodeHandle& nh)
{
  // Create publishers
  path_pub_ = nh.advertise<nav_msgs::Path>("path", 10);
  cmd_vel_pub_ = nh.advertise<geometry_msgs::Twist>("cmd_vel", 10);

  // TODO(enhancement): these should be loaded from ROS params
  k1_ = 2;
  k2_ = 0.5;
  min_velocity_ = 0.1;
  max_velocity_ = 0.1;
  max_angular_velocity_ = 0.2;
  beta_ = 0.1;
  lambda_ = 0.1;
}

bool BaseController::approach2(const geometry_msgs::PoseStamped& target)
{
  // Transform pose by -dist_ in the X direction of the dock
  geometry_msgs::PoseStamped pose = target;
  {
    tf::Quaternion q;
    tf::quaternionMsgToTF(pose.pose.orientation, q);
    double theta = angles::normalize_angle(tf::getYaw(q));
    ROS_INFO("THETA1: %f", theta);
    // If the target has an invalid orientation then don't approach it.
    if (!std::isfinite(theta))
    {
      ROS_ERROR_STREAM_NAMED("controller", "Invalid approach target for docking.");
      stop();
      return true;
    }
    pose.pose.position.x += cos(theta) * -dist_;
    //pose.pose.position.y += sin(theta) * -dist_;
  }

  // Transform target into base frame
  try
  {
    pose.header.stamp = ros::Time(0);
    listener_.transformPose("base_link", pose, pose);
  }
  catch (tf::TransformException const &ex)
  {
    ROS_WARN_STREAM_THROTTLE(1.0, "Couldn't get transform from dock to base_link");
    stop();
    return false;
  }

  // Distance to goal
  double r = std::sqrt(pose.pose.position.x * pose.pose.position.x +
                       pose.pose.position.y * pose.pose.position.y);
  ROS_INFO("Distance: %f", r);
  // Once we get close, reduce d_
  if (r < 0.3)
  {
    // This part is trying to bring the target point into the goal but right now it just jumps from
    // some virtual pose to the actual pose. We want to bring it in more gradually.
    //dist_ = 0.0;

    // dist_ = 1.6*r - 0.08;
    // if (dist_ < 0.0) dist_ = 0.0;
  }

  // If within distance tolerance, return true
  if (r < 0.03)
  {
    stop();
    return true;
  }

  // Orientation base frame relative to r_
  double delta = std::atan2(-pose.pose.position.y, pose.pose.position.x);

  // Determine orientation of goal frame relative to r_
  tf::Quaternion q;
  tf::quaternionMsgToTF(pose.pose.orientation, q);
  double theta = angles::normalize_angle(tf::getYaw(q) + delta);
  ROS_INFO("THETA2: %f", theta);
  double delta2  = std::atan2(-pose.pose.position.y, 0.5);
  double theta2 = angles::normalize_angle( delta2);
  ROS_INFO("THETA3: %f", theta2);
  // Compute the virtual control
  double a = atan(-k1_ * theta);
  // Compute curvature (k)
  double k = 1.0/r * (k2_ * (delta - a) - (1 + (k1_/1+((k1_*theta)*(k1_*theta))))*sin(delta));

  // Compute max_velocity based on curvature
  double v = max_velocity_ / (1 + beta_ * std::pow(fabs(k), lambda_));
  // Limit max velocity based on approaching target (avoids overshoot)
  if (r < 0.50)
  {
    v = std::max(min_velocity_, std::min(std::min(std::max(r/3,0.005), max_velocity_), v));
  }
  else
  {
    v = std::min(max_velocity_, std::max(min_velocity_, v));
  }

  // Compute angular velocity
  double w = k * v;
  
  // Bound angular velocity
  double bounded_w = std::min(max_angular_velocity_, std::max(-max_angular_velocity_, w));
  // Make sure that if we reduce w, we reduce v so that kurvature is still followed
  if (w != 0.0)
  {
    v *= (bounded_w/w);
  }

  if (r < 0.05)
  {
    bounded_w = 0;
  }

  // Send command to base
  command_.linear.x = v;
  command_.angular.z = bounded_w;
  cmd_vel_pub_.publish(command_);
  ROS_INFO("Z: %f, X: %f", command_.angular.z, command_.linear.x);

  // Create debugging view of path
  nav_msgs::Path plan;
  plan.header.stamp = ros::Time::now();
  plan.header.frame_id = "base_link";
  // Add origin
  geometry_msgs::PoseStamped path_pose;
  path_pose.header.frame_id = "base_link";
  path_pose.pose.orientation.w = 1.0;
  plan.poses.push_back(path_pose);
  double yaw = 0.0;
  for (int i = 0; i < 20; i++)  // 2 sec
  {
    path_pose.pose.position.x += 0.1 * command_.linear.x * cos(yaw);
    path_pose.pose.position.y += 0.1 * command_.linear.x * sin(yaw);
    yaw += 0.1 * command_.angular.z;
    path_pose.pose.orientation.z = sin(theta/2.0);
    path_pose.pose.orientation.w = cos(theta/2.0);

    double dx = path_pose.pose.position.x - pose.pose.position.x;
    double dy = path_pose.pose.position.y - pose.pose.position.y;
    if ((dx * dx + dy * dy) < 0.005)
    {
      break;
    }

    plan.poses.push_back(path_pose);
  }
  // Push goal pose onto path
  plan.poses.push_back(pose);
  // Publish path
  path_pub_.publish(plan);

  return false;
}

bool BaseController::approach(double distance, geometry_msgs::PoseStamped dock_pose)
{
  double rotate_distance;
  // If the inputs are invalid then don't backup.
  if (!std::isfinite(distance))
  {
    ROS_ERROR_STREAM_NAMED("controller", "Backup parameters are not valid.");
    stop();
    return true; 
  }

  // Get current base pose in odom
  geometry_msgs::PoseStamped pose;
  pose.header.frame_id = "base_footprint";
  pose.pose.orientation.w = 1.0;

  
  try
   {
     listener_.waitForTransform(dock_pose.header.frame_id,
                                "base_footprint",
                                dock_pose.header.stamp,
                                ros::Duration(0.1));
      listener_.transformPose( "base_footprint", dock_pose, pose);

  }


  


  catch (tf::TransformException const &ex)
  {
    ROS_WARN_STREAM_THROTTLE(1.0, "Couldn't get transform from base_link to odom");
    stop();
    return false;
  }

  // If just getting started, stow starting pose
  if (!ready_)
  {
    start_ = pose;
    turning_ = false;
    ready_ = true;
    ROS_INFO("READY");
  }

  tf::StampedTransform transform; 
  tf::Quaternion q1, q2;
  tf::quaternionMsgToTF(pose.pose.orientation, q2);


  listener_.lookupTransform("/dock_link", "/base_footprint",
                            ros::Time(0), transform);

  double theta = angles::normalize_angle(tf::getYaw(q2));
  double dock_yaw = angles::normalize_angle(tf::getYaw(transform.getRotation()));
  double dx = transform.getOrigin().x();// - start_.pose.position.x;
  double dy = transform.getOrigin().y();// - start_.pose.position.y;
  double cdistance = (dx * dx + dy * dy);
  ROS_INFO("X: %f, Y: %f, Theta: %f",dx, dy, dock_yaw);
  ROS_INFO("THETA: %f, ADISTANCE: %f", theta, cdistance);

  // Nếu độ lệch so với trạm nhỏ, thì quay tại chỗ  để  lấy góc thẳng
  if(fabs(dy) < 0.4) // Độ lệch theo trục y so với tâm dock < 0.4m thì được phép thực hiện docking
  {
    double alpha;
    if(fabs(dx) > 0.5)
    {
      alpha = -atan(dy/0.5);
    }
    else
    {
      alpha = -atan(dy/0.5);
    }
    
    ROS_INFO("ALPHA: %f", alpha);
    if(fabs(dx) > distance +0.1)
    {
      ROS_INFO("FL");
      command_.linear.x = 0.01;
      if(dy>0.01)
      {
        command_.angular.z = -0.2;
      }
      else if (dy < -0.01)
      {
        command_.angular.z = 0.2;
      }
      else
      {
        command_.angular.z = 0.0;
      }

      if((dy > 0 && theta > 0.3) || (dy < 0 && theta < -0.3))
          command_.angular.z = 0.0;
    }
    else if (fabs(dx) > distance && fabs(dx) <= distance +0.1 )
    {
      //ROS_INFO("Fix");
      command_.linear.x = 0.0;
      if(turning_ == false)
      {
        ROS_INFO("Fix-Turn");
        if(theta < -0.03)
        {
          command_.angular.z = -0.02;
        } else if(theta > 0.03)
        {
          command_.angular.z = 0.02;
        }
        else
        {
          command_.angular.z = 0.0;
          turning_=true;
          ROS_INFO("Fix-TurnFinish");
        }
      }
      else
      {
        ROS_INFO("Fix-dock");
        command_.linear.x = 0.03;
        command_.angular.z = 0.0;
      }
      
    }
    else
    {
      ROS_INFO("Stopped");
      stop();
    }
    
  }
  else
  {
    //stop();
  }
  



  // if (turning_)
  // {
  //   ROS_INFO("TURNING");
  //   // Get yaw angles
    
  //   tf::quaternionMsgToTF(start_.pose.orientation, q1);
  //   tf::quaternionMsgToTF(dock_pose.pose.orientation, q2);
  //   //theta = angles::normalize_angle(tf::getYaw(q2));
  //   theta  = std::atan2(-pose.pose.position.y, 0.5);
  //   ROS_INFO("THETA: %f", theta);
  //   double error = angles::normalize_angle(rotate_distance - theta);
  //   ROS_INFO("Error: %f",error);
  //   if (fabs(theta) < 0.05)
  //   {
  //     stop();
  //     return true;
  //   }
  //   else if (theta > 0.0)
  //   {
  //     command_.angular.z = std::min(1.0, fabs(error)*1.0);
  //   }
  //   else
  //   {
  //     command_.angular.z = std::max(-1.0, -fabs(error)*1.0);
  //   }
  // }
  // else
  // {
  //   // Check if have backed up enough
  //   double dx = dock_pose.pose.position.x;// - start_.pose.position.x;
  //   double dy = dock_pose.pose.position.y;// - start_.pose.position.y;
  //   if ((dx * dx + dy * dy) > (distance * distance))
  //   {
  //     if (theta == 0.0)
  //     {
  //       stop();
  //       return true;
  //     }
  //     else
  //     {
  //       //turning_ = true;
  //       command_.linear.x = 0.0;
  //     }
  //   }
  //   else
  //   {
  //     command_.linear.x = -0.1;
  //   }
  // }

  cmd_vel_pub_.publish(command_);
  return false;
}

bool BaseController::getCommand(geometry_msgs::Twist& command)
{
  command = command_;
  return true;
}

void BaseController::stop()
{
  command_ = geometry_msgs::Twist();
  cmd_vel_pub_.publish(command_);

  // Reset the backup controller
  ready_ = false;

  // Reset the approach controller
  dist_ = 0.5;
}
