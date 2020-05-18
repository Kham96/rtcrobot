#!/usr/bin/env python

import rospy
import roslaunch
from rtcrobot_msgs.msg import RobotMode
from sensor_msgs.msg import Joy

class RunNode(object):
    def __init__(self):
        rospy.init_node("runnode")
        self.manual_launch_ = rospy.get_param("~manual_files", [])
        self.mapping_launch_ = rospy.get_param("~mapping_files", [])
        self.auto_launch_ = rospy.get_param("~auto_files", [])
        rospy.loginfo(self.manual_launch_)
        self.lst_mapping = list()
        self.lst_manual = list()
        self.lst_auto = list()
        self.triger = False
        self.mode_ = None

        #!Start a node
        #node = roslaunch.core.Node('rtcrobot_base', 'robotpose.py')
        #launch = roslaunch.scriptapi.ROSLaunch()
        #launch.start()

        #self.process = launch.launch(node)
        #print self.process.is_alive()
        #self.process.stop()

        #!Start a launch file
        self.uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
        roslaunch.configure_logging(self.uuid)
        #launch = roslaunch.parent.ROSLaunchParent(uuid, ["/home/haier/catkin_ws/src/testapi/launch/test_node.launch"])
        #launch.start()
        #rospy.loginfo("started")

        #rospy.sleep(3)
        # 3 seconds later
        #launch.shutdown()
        self.mode_sub_ = rospy.Subscriber('robot_mode', RobotMode, self.mode_callback)
        self.joy_sub_ = rospy.Subscriber('joy', Joy, self.joy_callback)

    def spin(self):
        r = rospy.Rate(10)

        while not rospy.is_shutdown():
            if(self.triger):
                rospy.logwarn(self.mode_)
                if(self.mode_ == 0): #manual
                    self.auto_stop()
                    self.mapping_stop()
                    self.manual_start()
                    rospy.loginfo('Start manual')

                if(self.mode_ == 1): #mapping
                    self.auto_stop()
                    self.manual_stop()
                    self.mapping_start()
		    rospy.loginfo('Start mapping')
                    pass

                if(self.mode_ == 2): #auto
                    self.mapping_stop()
                    self.manual_stop()
                    self.auto_start()
		    rospy.loginfo('Start auto')
                    pass

                self.triger = False

            r.sleep()

    def mode_callback(self, msg):
        rospy.loginfo(msg.name)
        self.mode_ = msg.code
        self.triger = True
        pass

    def joy_callback(self, msg):
        if(msg.buttons[5] == 1):
            pass
        pass
    
    #! MAPPING MODE
    def mapping_start(self):
        try:
	    rospy.loginfo(self.mapping_launch_)
            launch = roslaunch.parent.ROSLaunchParent(self.uuid, self.mapping_launch_)
            launch.start()
            self.lst_mapping.append(launch)
            rospy.loginfo("mapping node")
        except:
            rospy.logerr('Cannot run launch file')
        pass

    def mapping_stop(self):
        for launc in self.lst_mapping:
            launc.shutdown()
        del self.lst_mapping[:]
        pass
    
    #! SLAM MODE
    def auto_start(self):
        try:
            launch = roslaunch.parent.ROSLaunchParent(self.uuid, self.auto_launch_)
            launch.start()
            self.lst_auto.append(launch)
	    rospy.loginfo("auto node")
        except:
            rospy.logerr('Cannot run launch file')
        pass

    def auto_stop(self):
        for launc in self.lst_auto:
            launc.shutdown()
        del self.lst_auto[:]
        pass

    #! MANUAL MODE
    def manual_start(self):
        try:

            launch = roslaunch.parent.ROSLaunchParent(self.uuid, self.manual_launch_)
            launch.start()
            self.lst_manual.append(launch)
	    rospy.loginfo("manual node")
        except:
            rospy.logerr('Cannot run launch file')
        pass

    def manual_stop(self):
        for launc in self.lst_manual:
            launc.shutdown()
        del self.lst_manual[:]
        pass

    

#############################################################################
#############################################################################
if __name__ == '__main__':
    """ main """
    try:
        runnode = RunNode()
        runnode.spin()
    except rospy.ROSInterruptException:
        pass
