#!/usr/bin/env python
import argparse
import rospy
import roslaunch

from dynamic_reconfigure.server import Server
from dynamic_reconfigure.client import Client
from rtcrobot.cfg import RTCRobotConfig

#Service Message
import std_srvs.srv



#!Start Control Class
class RTCRobot:
    #############################################################################
    def __init__(self):
        rospy.init_node('rtcrobot') #, anonymous=True

        self.uuidnavigation = roslaunch.rlutil.get_or_generate_uuid(None, False)
        #roslaunch.configure_logging(self.uuid)
        self.launchnavigation = roslaunch.parent.ROSLaunchParent(self.uuidnavigation, ["/home/uzi/catkin_ws/src/rtcrobot/launch/navigation.launch"])
        self.isnavigation = False
        self.isActive = False
        self.rate = 50

        #self._cfg = RTCRobotConfig()

        
        s = rospy.Service('rtcrobot_start', std_srvs.srv.Empty, self.rtcrobot_start)
        s = rospy.Service('rtcrobot_stop', std_srvs.srv.Empty, self.rtcrobot_stop)

        #* Dynamic parameter
        dynamic_configure_server = Server(RTCRobotConfig, self.dynamic_callback)
        dynamic_configure_client = Client('rtcrobot')

        # params = { 'int_param' : '60', 'double_param' : .6 }
        # config = dynamic_configure_client.update_configuration(params)
        
        #*Run Webserver
        uuidwebserver = roslaunch.rlutil.get_or_generate_uuid(None, False)
        uuidwebserver = roslaunch.parent.ROSLaunchParent(uuidwebserver, ["/home/uzi/catkin_ws/src/rtcrobot/launch/webserver.launch"])
        uuidwebserver.start()
        rospy.loginfo("OK")

    #############################################################################
    def rtcrobot_start(self, req):
        print ("Start ")
        if not self.isnavigation:
            self.isnavigation = True
            self.isActive = True
        return True

    #############################################################################
    def rtcrobot_stop(self, req):
        print ("Stop ")
        if self.isnavigation:
            self.isnavigation = False
            self.isActive = True
        return True
        
    #############################################################################
    def spinOne(self):
        if self.isActive :
            if  self.isnavigation:
                self.uuidnavigation = roslaunch.rlutil.get_or_generate_uuid(None, False)
                #roslaunch.configure_logging(self.uuid)
                self.launchnavigation = roslaunch.parent.ROSLaunchParent(self.uuidnavigation, ["/home/uzi/catkin_ws/src/rtcrobot/launch/navigation.launch"])
                self.launchnavigation.start()
            else:
                self.launchnavigation.shutdown()
            self.isActive = False

    #############################################################################
    def spin(self):
        r = rospy.Rate(self.rate)
        while not rospy.is_shutdown():
            self.spinOne()
            #r.sleep()

    #############################################################################
    #TODO: Callback when dynamic parameter changed
    def dynamic_callback(self, config, level):
        rospy.loginfo("""Reconfiugre Request: {int_param}, {double_param},\ 
          {str_param}, {bool_param}, {size}""".format(**config))
        return config
#!End Control Class