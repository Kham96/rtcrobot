#!/usr/bin/env python
# license removed for brevity
#import roslib
import rospy
import struct
#from std_msgs.msg import Int32
from std_msgs.msg import String
from std_msgs.msg import Float64
from sensor_msgs.msg import BatteryState
import serial

ser = serial.Serial('/dev/ttyUSB1', 19200)
bat = BatteryState()
bat.design_capacity = 105
# Power supply status constants
bat.POWER_SUPPLY_STATUS_UNKNOWN 
bat.POWER_SUPPLY_STATUS_CHARGING
bat.POWER_SUPPLY_STATUS_DISCHARGING 
bat.POWER_SUPPLY_STATUS_NOT_CHARGING
bat.POWER_SUPPLY_STATUS_FULL 
# Power supply health constants
bat.POWER_SUPPLY_HEALTH_UNKNOWN
bat.POWER_SUPPLY_HEALTH_GOOD 
bat.POWER_SUPPLY_HEALTH_OVERHEAT 
bat.POWER_SUPPLY_HEALTH_DEAD 
bat.POWER_SUPPLY_HEALTH_OVERVOLTAGE 
bat.POWER_SUPPLY_HEALTH_UNSPEC_FAILURE
bat.POWER_SUPPLY_HEALTH_COLD 
bat.POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE 
bat.POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE 
# Power supply technology (chemistry) constants
bat.POWER_SUPPLY_TECHNOLOGY_UNKNOWN 
bat.POWER_SUPPLY_TECHNOLOGY_NIMH 
bat.POWER_SUPPLY_TECHNOLOGY_LION 
bat.POWER_SUPPLY_TECHNOLOGY_LIPO 
bat.POWER_SUPPLY_TECHNOLOGY_LIFE
bat.POWER_SUPPLY_TECHNOLOGY_NICD 
bat.POWER_SUPPLY_TECHNOLOGY_LIMN 

def talker():
  pub = rospy.Publisher('battery', BatteryState,queue_size=10)
  rospy.init_node('battery_note',anonymous=True)
  rate = rospy.Rate(10)
  data=[None for i in range (70)]
  
  while not rospy.is_shutdown():
    d = ser.read()
    

    if d == b'Z':
        for i in range(70):
            
            data[i]= ser.read()
        #print(data)
        if data[0:5]==[b'\xa5', b')', b'\x82', b'\x10', b'\x00']:
            tupledata01= struct.unpack('>B',data[5])
            tupledata02= struct.unpack('>B',data[6])
            data0= tupledata01[0]*256+tupledata02[0]
            tupledata11= struct.unpack('>B',data[7])
            tupledata12= struct.unpack('>B',data[8])
            data1= tupledata11[0]*256+tupledata12[0]
            tupledata61= struct.unpack('>B',data[17])
            tupledata62= struct.unpack('>B',data[18])
            data6= tupledata61[0]*256+tupledata62[0]
            tupledata91= struct.unpack('>B',data[23])
            tupledata92= struct.unpack('>B',data[24])
            data9= tupledata91[0]*256+tupledata92[0]
            tupledata101= struct.unpack('>B',data[25])
            tupledata102= struct.unpack('>B',data[26])
            data10= tupledata101[0]*256+tupledata102[0]
            tupledata111= struct.unpack('>B',data[27])
            tupledata112= struct.unpack('>B',data[28])
            data11= tupledata111[0]*256+tupledata112[0]
            tupledata121= struct.unpack('>B',data[29])
            tupledata122= struct.unpack('>B',data[30])
            data12= tupledata121[0]*256+tupledata122[0]
            tupledata131= struct.unpack('>B',data[31])
            tupledata132= struct.unpack('>B',data[32])
            data13= tupledata131[0]*256+tupledata132[0]
            tupledata141= struct.unpack('>B',data[33])
            tupledata142= struct.unpack('>B',data[34])
            data14= tupledata141[0]*256+tupledata142[0]
            tupledata151= struct.unpack('>B',data[35])
            tupledata152= struct.unpack('>B',data[36])
            data15= tupledata151[0]*256+tupledata152[0]
            tupledata161= struct.unpack('>B',data[37])
            tupledata162= struct.unpack('>B',data[38])
            data16= tupledata161[0]*256+tupledata162[0]
        
            bat.cell_voltage=[data9*0.001,data10*0.001,data11*0.001,data12*0.001,data13*0.001,data14*0.001,data15*0.001,data16*0.001]
            bat.voltage= data0*0.1 
            bat.percentage=data6
            if data[7]==b'\xff':
                datai1=65535-data1
                bat.charge=datai1*0.1
            else:
                bat.current= data1*0.1
                bat.charge=0

            #voltage= 'Dien ap : %s V' %(bat.voltage)
            #current='Dong dien :%s A'%(bat.current)
            #percentage="Phan tram: %s/100 " %(bat.percentage)
            #rospy.loginfo( voltage )
            #rospy.loginfo(current)
            #rospy.loginfo(percentage)
            pub.publish(bat)
    #rate.sleep()

if __name__ == '__main__':
  try:
    
   talker()
  except rospy.ROSInterruptException:
   pass
