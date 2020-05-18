#!/usr/bin/env python

import os
import rospy
import actionlib
import rtcrobot_actions.msg

class SaveMap(object):
    _result = rtcrobot_actions.msg.SaveMapResult()

    def __init__(self, name):
        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name, rtcrobot_actions.msg.SaveMapAction, execute_cb=self.execute_cb, auto_start=False)
        self._as.start()

    def execute_cb(self, goal):
        r = rospy.Rate(1)
        success = True

        rospy.loginfo("%s: Begin save map" % self._action_name)

        stream = os.popen('rosrun map_server map_saver -f ~/catkin_ws/src/rtcrobot/rtcrobot_navigation/maps/'+ goal.map_name)
        self._result.saved = True
        rospy.loginfo('%s: Succeeded' % self._action_name)
        self._as.set_succeeded(self._result)


if __name__ == '__main__':
    rospy.init_node('savemap')
    server = SaveMap(rospy.get_name())
    rospy.spin()

#stream = os.popen('rosrun map_server map_saver -f ~/catkin_ws/src/rtcrobot/rtcrobot_navigation/maps/HBShop')
#output = stream.read()
#print output