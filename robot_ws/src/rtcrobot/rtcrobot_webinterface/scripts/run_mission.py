#!/usr/bin/env python

from rtcrobot_services.srv import Mission,MissionResponse 
import rospy

def handle_add_two_ints(req):
    print("d")
    print req.name
    res = MissionResponse()
    res.status = "ok"
    return res

def add_two_ints_server():
    rospy.init_node('mission_request')
    s = rospy.Service('mission_request', Mission, handle_add_two_ints)
    rospy.spin()

if __name__ == "__main__":
    add_two_ints_server()