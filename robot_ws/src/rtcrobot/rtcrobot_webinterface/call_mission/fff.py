#!/usr/bin/env python
#{"status":1,"description":"","tyle":"save_mission","action":[{"y":220,"x":50,"Con":"Marker2","type":"Move","theta":1}],"name_mission":"fff","command":"save_mission"}
 #11:39:45
import rospkg
import rospy
import rtcrobot_actions

rospy.init_node('fff')

main():
  move = rtcrobot_actions.Move(50,220,1)
  move.goal()
  while(not move_state):
     pass
if __name__ =="__main__":
