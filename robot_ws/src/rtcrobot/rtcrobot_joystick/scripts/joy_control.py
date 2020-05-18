#!/usr/bin/env python

import math
import time

import rospy
import roslib
import rospkg

from geometry_msgs.msg import Twist
from std_msgs.msg import String, Float32, Empty
from sensor_msgs.msg import Joy
import rtcrobot_msgs.msg

class RobotMode(object):
    def __init__(self, name):
        self.action_name_ = name
        self.joy_sub_ = rospy.Subscriber('joy', Joy, self.sub_callback)
        self.mode_pub_ = rospy.Publisher('robot_mode', rtcrobot_msgs.msg.RobotMode , queue_size=1)
        self.mode_sub_ = rospy.Subscriber('robot_mode', rtcrobot_msgs.msg.RobotMode, self.mode_callback)
        self.cmd_vel_pub_ = rospy.Publisher('cmd_vel', Twist , queue_size=1)
        self.mode_ = 0 # default is manual mode
        self.out_msg = rtcrobot_msgs.msg.RobotMode()
        self.out_msg.name = 'manual'
        self.out_msg.code = 0

        self.linear_max_ = rospy.get_param("~linear_max", 1.0)
        self.angular_max_ = rospy.get_param("~angular_max", 1.0)
        self.axes_linear_ = rospy.get_param("~axes_linear", 4)
        self.axes_angular_ = rospy.get_param("~axes_angular", 3)
        self.button_manual_ = rospy.get_param("~button_manual", 0)
        self.button_mapping_ = rospy.get_param("~button_mapping", 1)
        self.button_auto_ = rospy.get_param("~button_auto", 2)
        
        
        rospy.loginfo("Robot mode default is manual mode ...")
    def mode_callback(self, msg):
        self.mode_ = msg.code

    def sub_callback(self, msg):
        if(msg.buttons[self.button_manual_] == 1 and self.mode_ != 0): #A button
            self.mode_ = 0 #!manual mode
            self.out_msg.name = 'manual'
            self.out_msg.code = self.mode_
            self.mode_pub_.publish(self.out_msg)

        if(self.mode_ == 0 or self.mode_ == 1):
            cmdvel_msg = Twist()
            cmdvel_msg.linear.x = msg.axes[self.axes_linear_] * abs(self.linear_max_/1.0)
            cmdvel_msg.angular.z = msg.axes[self.axes_angular_] * abs(self.angular_max_/1.0)
            self.cmd_vel_pub_.publish(cmdvel_msg)
        
        if(msg.buttons[self.button_mapping_] == 1 and self.mode_ != 1): #B button
            if(self.mode_ == 0):
                cmdvel_msg = Twist()
                self.cmd_vel_pub_.publish(cmdvel_msg)
            self.mode_ = 1 #!mapping mode
            self.out_msg.name = 'mapping'
            self.out_msg.code = self.mode_
            self.mode_pub_.publish(self.out_msg)

        if(msg.buttons[self.button_auto_] == 1 and self.mode_ != 2): #X button
            if(self.mode_ == 0 or self.mode_ == 1):
                cmdvel_msg = Twist()
                self.cmd_vel_pub_.publish(cmdvel_msg)
            self.mode_ = 2 #!auto mode
            self.out_msg.name = 'auto'
            self.out_msg.code = self.mode_
            self.mode_pub_.publish(self.out_msg)

        #if(msg.buttons[3] == 1 and self.mode_ != 3): #Y button
            #continue

        

    def spin(self):
        self.mode_pub_.publish(self.out_msg)
        r = rospy.Rate(50)
        while not rospy.is_shutdown():
            #rospy.loginfo("spin")
            r.sleep()
        #rospy.loginfo("spin")
        r.sleep()

    ######################################################################################################
#############################################################################
#############################################################################
if __name__ == '__main__':
    """ main """
    rospy.init_node('robot_mode')
    try:
        robotmode = RobotMode(rospy.get_name())
        robotmode.spin()
    except rospy.ROSInterruptException:
        pass
  
