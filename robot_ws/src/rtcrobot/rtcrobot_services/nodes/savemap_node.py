#!/usr/bin/env python
import rospy
import rtcrobot_services.savemap as savemap

if __name__ == '__main__':
    """ main """
    try:
        rospy.init_node("savemap",anonymous=True)
        s = savemap.SaveMap(mapname = "EShop")
        s.spin()
    except rospy.ROSInterruptException:
        pass
    #y = "2020-04-04 14:45:08.126754"
    #d = datetime.datetime.strptime(y,'%Y-%m-%d %H:%M:%S.%f')