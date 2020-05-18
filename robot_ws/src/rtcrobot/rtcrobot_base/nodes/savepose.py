#!/usr/bin/env python

import rospy
import roslib
import rospkg
import actionlib
import tf
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Pose
import time
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

import xml.etree.ElementTree as ET

class SavePoses(object):
    def __init__(self):
        rospy.init_node("saveposes")
        self.pose_ = Pose()
        # create the file structure
        xmldata = ET.Element('Marker')
        items = ET.SubElement(xmldata, 'items')
        item1 = ET.SubElement(items, 'item')
        item2 = ET.SubElement(items, 'item')
        item1.set('name','item1')
        item2.set('name','item2')
        item1.text = 'item1abc'
        item2.text = 'item2abc'
        # create a new XML file with the results
        mydata = ET.tostring(xmldata,method='xml').decode()
        myfile = open(rospkg.RosPack().get_path('rtcrobot_base')+"/data/marker.xml", "w+")
        myfile.write(mydata)
        myfile.close()

        self.listener = tf.TransformListener()


        self.pose_sub_ = rospy.Subscriber('/odom_comb', Odometry, self.sub_callback)
    
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

    def sendgoal(self):
        client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
        client.wait_for_server()

        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map" 
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = 50.1383
        goal.target_pose.pose.position.y = 52.8976
        goal.target_pose.pose.orientation.w = 1.0

        client.send_goal(goal)
        wait = client.wait_for_result()
        if not wait:
            rospy.logerr("Action server not available!")
            rospy.signal_shutdown("Action server not available!")
        else:
            return client.get_result()
#############################################################################
#############################################################################
if __name__ == '__main__':
    """ main """
    try:
        saveposes = SavePoses()
        saveposes.spin()
    except rospy.ROSInterruptException:
        pass
