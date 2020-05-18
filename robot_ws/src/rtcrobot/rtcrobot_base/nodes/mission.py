#!/usr/bin/env python

import math
import rospy
import roslib
import rospkg
import actionlib
import tf
import std_srvs.srv
from nav_msgs.msg import Odometry
import time
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from actionlib_msgs.msg import GoalStatus
from geometry_msgs.msg import Pose, Point, Quaternion
from tf.transformations import quaternion_from_euler
from std_msgs.msg import String, Float32, Empty

import xml.etree.ElementTree as ET

class Mission(object):
    def __init__(self):
        rospy.init_node("Mission")
        self.listener = tf.TransformListener()
        self.pose_sub_ = rospy.Subscriber('/odom_comb', Odometry, self.sub_callback)
        
        self.client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
        rospy.loginfo("Waiting for move_base action server...")
        wait = self.client.wait_for_server(rospy.Duration(5.0))
        if not wait:
            rospy.logerr("Action server not available!")
            rospy.signal_shutdown("Action server not available!")
            return
        rospy.loginfo("Connected to move base server")
        rospy.loginfo("Starting goals achievements ...")
        self.sendgoal(1.1483271436666391,1.2878072086213197, 1.866)
    
    def sub_callback(self, msg):
        #rospy.loginfo("Pose: %f, %f", self.pose_.position.x, self.pose_.position.y)
        self.pose_ = msg.pose.pose

    def spin(self):
        r = rospy.Rate(10)
        while not rospy.is_shutdown():
            try:
                (trans,rot) = self.listener.lookupTransform('/base_footprint', '/map', rospy.Time(0))
                print(rot)
            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                continue
            r.sleep()

    ######################################################################################################
    def active_cb(self):
        rospy.loginfo("Goal pose is now being processed by the Action Server...")

    def feedback_cb(self, feedback):
        rospy.loginfo("Feedback for goal pose received")
        #rospy.loginfo(feedback)

    def done_cb(self, status, result):
        if status == 2:
            rospy.loginfo("Goal pose received a cancel request after it started executing, completed execution!")

        if status == 3:
            rospy.loginfo("Goal pose reached") 
            rospy.loginfo("Final goal pose reached!")
            rospy.signal_shutdown("Final goal pose reached!")
            return

        if status == 4:
            rospy.loginfo("Goal pose was aborted by the Action Server")
            rospy.signal_shutdown("Goal pose aborted, shutting down!")
            return

        if status == 5:
            rospy.loginfo("Goal pose has been rejected by the Action Server")
            rospy.signal_shutdown("Goal pose rejected, shutting down!")
            return

        if status == 8:
            rospy.loginfo("Goal pose "+str(self.pose)+" received a cancel request before it started executing, successfully cancelled!")

    def sendgoal(self, x, y, theta):
        rospy.wait_for_service('/move_base_node/clear_costmaps')
        try:
           clearcostmaps = rospy.ServiceProxy('/move_base_node/clear_costmaps', std_srvs.srv.Empty)
           clearcostmaps()
        except rospy.ServiceException, e:
           print "Service call failed: %s"%e

        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now() 
        goal.target_pose.pose.position.x = x
        goal.target_pose.pose.position.y = y
        goal.target_pose.pose.orientation = Quaternion(*(quaternion_from_euler(0, 0, theta, axes='sxyz')))
        self.pose = goal.target_pose.pose
        rospy.loginfo("Sending goal pose "+str(self.pose)+" to Action Server")
        self.client.send_goal(goal, self.done_cb, self.active_cb, self.feedback_cb)
        rospy.spin()
#############################################################################
#############################################################################
if __name__ == '__main__':
    """ main """
    try:
        mission = Mission()
    except rospy.ROSInterruptException:
        pass
