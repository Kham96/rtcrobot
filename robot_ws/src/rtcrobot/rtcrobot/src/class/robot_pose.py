#!/usr/bin/env python
import argparse
import rospy

from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import Pose
from tf import TransformListener
from tf import Transformer


#Service Message
import std_srvs.srv



#!Start RTCRobot_Pose Class
class RTCRobot_Pose:
    #############################################################################
    def __init__(self):
        rospy.init_node('rtcrobot_pose') #, anonymous=True
        nodename = rospy.get_name()

        self.map_frame = rospy.get_param("map_frame", "/map")
        self.base_frame = rospy.get_param("base_frame", "/base_footprint")
        self.publish_frequency = rospy.get_param("publish_frequency", 10)

        self.p_pub = rospy.Publisher()
        if(is_stamped):
            p_pub = rospy.Publisher('robot_pose', PoseStamped, queue_size=1)
        else:
            p_pub = ospy.Publisher('robot_pose', Pose, queue_size=1)

        self.rate = self.publish_frequency

        self.listener = TransformListener()
        self.listener.waitForTransform(self.map_frame,self.base_frame,rospy.Duration(secs = 1.0))
        rtcrobot_pose
        
        pose_stamped = PoseStamped()
        pose_stamped.header.frame_id = self.map_frame
        pose_stamped.header.stamp = rospy.Time.now()

        pose_stamped.pose.orientation.x = rot[0]
        pose_stamped.pose.orientation.y = rot[1]
        pose_stamped.pose.orientation.z = rot[2]
        pose_stamped.pose.orientation.w = rot[3]
rtcrobot_pose = tran[2]

        if(is_stamped):
            self.p_pub.publish(pose_stamped)
        else
            self.p_pub.publish(pose_stamped.pose)

    #############################################################################
    def spin(self):
        r = rospy.Rate(self.publish_frequency)
        while not rospy.is_shutdown():
            self.spinOne()
            r.sleep()

#!End RTCRobot_Pose Class