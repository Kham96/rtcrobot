; Auto-generated. Do not edit!


(cl:in-package rtcrobot_actions-msg)


;//! \htmlinclude MissionGoal.msg.html

(cl:defclass <MissionGoal> (roslisp-msg-protocol:ros-message)
  ((mission_id
    :reader mission_id
    :initarg :mission_id
    :type cl:string
    :initform "")
   (command
    :reader command
    :initarg :command
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass MissionGoal (<MissionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MissionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MissionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rtcrobot_actions-msg:<MissionGoal> is deprecated: use rtcrobot_actions-msg:MissionGoal instead.")))

(cl:ensure-generic-function 'mission_id-val :lambda-list '(m))
(cl:defmethod mission_id-val ((m <MissionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot_actions-msg:mission_id-val is deprecated.  Use rtcrobot_actions-msg:mission_id instead.")
  (mission_id m))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <MissionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot_actions-msg:command-val is deprecated.  Use rtcrobot_actions-msg:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MissionGoal>) ostream)
  "Serializes a message object of type '<MissionGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mission_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mission_id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MissionGoal>) istream)
  "Deserializes a message object of type '<MissionGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mission_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mission_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'command) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'command)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MissionGoal>)))
  "Returns string type for a message object of type '<MissionGoal>"
  "rtcrobot_actions/MissionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MissionGoal)))
  "Returns string type for a message object of type 'MissionGoal"
  "rtcrobot_actions/MissionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MissionGoal>)))
  "Returns md5sum for a message object of type '<MissionGoal>"
  "0b5710aba2e48af8e934e12797bc144d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MissionGoal)))
  "Returns md5sum for a message object of type 'MissionGoal"
  "0b5710aba2e48af8e934e12797bc144d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MissionGoal>)))
  "Returns full string definition for message of type '<MissionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the goal~%# Specify an (optional) name for the mission~%string mission_id~%~%string[] command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MissionGoal)))
  "Returns full string definition for message of type 'MissionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the goal~%# Specify an (optional) name for the mission~%string mission_id~%~%string[] command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MissionGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mission_id))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'command) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MissionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MissionGoal
    (cl:cons ':mission_id (mission_id msg))
    (cl:cons ':command (command msg))
))
