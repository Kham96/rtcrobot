import math
import rospy
import actionlib
import std_srvs.srv
import time
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Pose, Quaternion
from tf.transformations import quaternion_from_euler

#region Move Action
#
#
#
class Move(object):
    def __init__(self, x, y, theta, clearcostmap = False):
        self.x = x
        self.y = y
        self.theta = theta
        self.clearcostmap = clearcostmap
        self.state = 0
        

    def __active_cb(self):
        rospy.loginfo("Goal pose is now being processed by the Action Server...")

    def __feedback_cb(self, feedback):
        rospy.loginfo("Feedback for goal pose received")
        #rospy.loginfo(feedback)

    def __done_cb(self, status, result):
        self.state = status
        if status == 2:
            rospy.loginfo("Goal pose received a cancel request after it started executing, completed execution!")

        if status == 3:
            rospy.loginfo("Goal pose reached") 
            rospy.loginfo("Final goal pose reached!")
            #rospy.signal_shutdown("Final goal pose reached!")
            return

        if status == 4:
            rospy.loginfo("Goal pose was aborted by the Action Server")
            rospy.signal_shutdown("Goal pose aborted, shutting down!")
            return

        if status == 5:
            rospy.loginfo("Goal pose has been rejected by the Action Server")
            rospy.signal_shutdown("Goal pose rejected, shutting down!")
            return

        if status == 8:
            rospy.loginfo("Goal pose received a cancel request before it started executing, successfully cancelled!")

    def run(self, clearcostmap = False):
        try:
            client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
            wait = client.wait_for_server(rospy.Duration(5.0))
            if not wait:
                rospy.logerr("Action server not available!")
                return False
        except:
            return False

        if self.clearcostmap or clearcostmap:
            rospy.wait_for_service('/move_base_node/clear_costmaps')
            try:
                clearcostmaps = rospy.ServiceProxy('/move_base_node/clear_costmaps', std_srvs.srv.Empty)
                clearcostmaps()
            except rospy.ServiceException, e:
                print "Service call failed: %s"%e

        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now() 
        goal.target_pose.pose.position.x = self.x
        goal.target_pose.pose.position.y = self.y
        goal.target_pose.pose.orientation = Quaternion(*(quaternion_from_euler(0, 0, self.theta, axes='sxyz')))
        client.send_goal(goal, self.__done_cb, self.__active_cb, self.__feedback_cb)
        
        wait = client.wait_for_result()
        if not wait:
            rospy.logerr("Action server not available!")
            print self.client.get_result()
            return False
        rospy.loginfo("Connected to move base server")
        rospy.loginfo("Starting goals achievements ...")
        return True
        
#endregion

#region Charge Action
#
#
#
class Charge(object):
    def __init__(self, minlevel = 50, mintime = 0):
        self.minlevel = minlevel
        self.mintime = mintime
        pass

    def run(self):
        pass
#endregion

#region Dock Action
#
#
#
class Dock(object):
    def __init__(self, mindistance = 50):
        pass

    def run(self):
        pass
#endregion        