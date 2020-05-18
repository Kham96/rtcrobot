#!/usr/bin/env python
import serial
from time import sleep
import rospy
import roslib
from std_msgs.msg import Int32
from geometry_msgs.msg import Twist 


class KYDBL48302E():

    ser = serial.Serial('/dev/motordriver',115200)

    def pushSpeed(self,motor1 = 0,motor2 = 0):
        data = b'!M {0} {1}\r'
        self.ser.write(data.format(motor1,motor2))

    def getEncoder(self):
        self.ser.write(b'?C\r')
        while True:
            data = self.ser.read_until('\r',None) 
            if data.startswith('C='):
                self.ser.reset_input_buffer()  
                enc =data.strip().replace('C=','').split(':')
                self.lenc = enc[0]
                self.renc = enc[1]
                break

    #############################################################
    def __init__(self):
    #############################################################
        rospy.init_node("KYDBL48302E")
        nodename = rospy.get_name()
        #rospy.loginfo("%s started" % nodename)
    
        self.w = rospy.get_param("base_width", 0.35)
    
        self.pub_lmotor = rospy.Publisher('lwheel', Int32, queue_size=10)
        self.pub_rmotor = rospy.Publisher('rwheel', Int32, queue_size=10)
        rospy.Subscriber('cmd_vel', Twist, self.twistCallback)
    
    
        self.rate = rospy.get_param("rate", 50)
        self.timeout_ticks = rospy.get_param("timeout_ticks", 2)
        self.left = 0
        self.right = 0
        self.lenc = 0
        self.renc = 0

    #############################################################
    def spin(self):
    #############################################################
    
        r = rospy.Rate(self.rate)
        idle = rospy.Rate(50)
        then = rospy.Time.now()
        self.ticks_since_target = self.timeout_ticks
    
        ###### main loop  ######
        while not rospy.is_shutdown():
        
            while not rospy.is_shutdown() and self.ticks_since_target < self.timeout_ticks:
                self.spinOnce()
                r.sleep()

            self.getEncoder()
            self.pub_lmotor.publish(int(self.lenc))
            self.pub_rmotor.publish(int(self.renc))
            idle.sleep()
                
    #############################################################
    def spinOnce(self):
    #############################################################
    
        # dx = (l + r) / 2
        # dr = (r - l) / w
            
        self.right = (1.0 * self.dx + self.dr * self.w / 2 ) * 1000
        self.left  = (1.0 * self.dx - self.dr * self.w / 2 ) * 1000
        # rospy.loginfo("publishing: (%d, %d)", left, right) 
                
        self.pushSpeed(self.left,self.right)
            
        self.ticks_since_target += 1

    #############################################################
    def twistCallback(self,msg):
    #############################################################
        # rospy.loginfo("-D- twistCallback: %s" % str(msg))
        self.ticks_since_target = 0
        self.dx = msg.linear.x
        self.dr = msg.angular.z
        self.dy = msg.linear.y


#############################################################
#############################################################
if __name__ == '__main__':
    """ main """
    try:
        driver = KYDBL48302E()
        driver.spin()
    except rospy.ROSInterruptException:
        pass


