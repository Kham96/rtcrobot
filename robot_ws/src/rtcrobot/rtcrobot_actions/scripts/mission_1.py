import rospy
from rtcrobot_actions.actions import Move, Charge, Dock
from rtcrobot_msgs.msg import MissionState

pub = rospy.Publisher('rtcrobot/mission', MissionState, queue_size=1)
msg = MissionState()
msg.name ='mission_1'

def publish(name='', code = 0, decription = ''):
    msg.action = name
    msg.code = code
    msg.decription = decription
    pub.publish(msg)

def mission():
    count = 5
    while count > 0:
        #region Move to goal x=1.125, y=2.235, theta=1.201
        publish('Move', 0, 'Running')
        move = Move(x=1.125, y=2.235, theta=1.201)

        if move.run():
            while not move.state:
                publish('Move', 0, 'Running')
                pass
        else:
            publish('Move', 1, 'Failed')
            print 'Error'
            break

        #endregion

        # Repeat time
        count = count - 1

    publish('Mission', 0, 'False')
    rospy.loginfo('Mission done!')

if __name__ == "__main__":
    rospy.init_node('Mission', anonymous=True)
    pub.publish(msg)
    mission()
    rospy.spin()
    pass