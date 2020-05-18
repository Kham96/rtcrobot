#!/usr/bin/env python
import rospy
from robotconfigure import RTCRobot

#############################################################################
#############################################################################
if __name__ == '__main__':
    """Main"""
    try:
        rtcrobot  = RTCRobot()
        rtcrobot.spin()
    except rospy.ROSInterruptException:
        pass

    