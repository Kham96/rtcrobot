;; Auto-generated. Do not edit!


(when (boundp 'rtcrobot_actions::DockFeedback)
  (if (not (find-package "RTCROBOT_ACTIONS"))
    (make-package "RTCROBOT_ACTIONS"))
  (shadow 'DockFeedback (find-package "RTCROBOT_ACTIONS")))
(unless (find-package "RTCROBOT_ACTIONS::DOCKFEEDBACK")
  (make-package "RTCROBOT_ACTIONS::DOCKFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude DockFeedback.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass rtcrobot_actions::DockFeedback
  :super ros::object
  :slots (_dock_pose _command ))

(defmethod rtcrobot_actions::DockFeedback
  (:init
   (&key
    ((:dock_pose __dock_pose) (instance geometry_msgs::PoseStamped :init))
    ((:command __command) (instance geometry_msgs::Twist :init))
    )
   (send-super :init)
   (setq _dock_pose __dock_pose)
   (setq _command __command)
   self)
  (:dock_pose
   (&rest __dock_pose)
   (if (keywordp (car __dock_pose))
       (send* _dock_pose __dock_pose)
     (progn
       (if __dock_pose (setq _dock_pose (car __dock_pose)))
       _dock_pose)))
  (:command
   (&rest __command)
   (if (keywordp (car __command))
       (send* _command __command)
     (progn
       (if __command (setq _command (car __command)))
       _command)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _dock_pose
    (send _dock_pose :serialization-length)
    ;; geometry_msgs/Twist _command
    (send _command :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _dock_pose
       (send _dock_pose :serialize s)
     ;; geometry_msgs/Twist _command
       (send _command :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _dock_pose
     (send _dock_pose :deserialize buf ptr-) (incf ptr- (send _dock_pose :serialization-length))
   ;; geometry_msgs/Twist _command
     (send _command :deserialize buf ptr-) (incf ptr- (send _command :serialization-length))
   ;;
   self)
  )

(setf (get rtcrobot_actions::DockFeedback :md5sum-) "c91416905ed1b41536bce4f154e2b284")
(setf (get rtcrobot_actions::DockFeedback :datatype-) "rtcrobot_actions/DockFeedback")
(setf (get rtcrobot_actions::DockFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Define a feedback message
# Feedback is the detected pose of the dock.
geometry_msgs/PoseStamped dock_pose

# Plus the control output
geometry_msgs/Twist command


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :rtcrobot_actions/DockFeedback "c91416905ed1b41536bce4f154e2b284")

