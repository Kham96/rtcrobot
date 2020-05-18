; Auto-generated. Do not edit!


(cl:in-package rtcrobot_msgs-msg)


;//! \htmlinclude RobotMode.msg.html

(cl:defclass <RobotMode> (roslisp-msg-protocol:ros-message)
  ((code
    :reader code
    :initarg :code
    :type cl:fixnum
    :initform 0)
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass RobotMode (<RobotMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rtcrobot_msgs-msg:<RobotMode> is deprecated: use rtcrobot_msgs-msg:RobotMode instead.")))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <RobotMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot_msgs-msg:code-val is deprecated.  Use rtcrobot_msgs-msg:code instead.")
  (code m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <RobotMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot_msgs-msg:name-val is deprecated.  Use rtcrobot_msgs-msg:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotMode>) ostream)
  "Serializes a message object of type '<RobotMode>"
  (cl:let* ((signed (cl:slot-value msg 'code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotMode>) istream)
  "Deserializes a message object of type '<RobotMode>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'code) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotMode>)))
  "Returns string type for a message object of type '<RobotMode>"
  "rtcrobot_msgs/RobotMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotMode)))
  "Returns string type for a message object of type 'RobotMode"
  "rtcrobot_msgs/RobotMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotMode>)))
  "Returns md5sum for a message object of type '<RobotMode>"
  "d02f0003881d9ef2396a7f7c3b4db158")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotMode)))
  "Returns md5sum for a message object of type 'RobotMode"
  "d02f0003881d9ef2396a7f7c3b4db158")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotMode>)))
  "Returns full string definition for message of type '<RobotMode>"
  (cl:format cl:nil "# code of the mode~%int8 code~%~%# name of the mode~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotMode)))
  "Returns full string definition for message of type 'RobotMode"
  (cl:format cl:nil "# code of the mode~%int8 code~%~%# name of the mode~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotMode>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotMode>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotMode
    (cl:cons ':code (code msg))
    (cl:cons ':name (name msg))
))
