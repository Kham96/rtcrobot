; Auto-generated. Do not edit!


(cl:in-package rtcrobot-msg)


;//! \htmlinclude Control.msg.html

(cl:defclass <Control> (roslisp-msg-protocol:ros-message)
  ((rvel_target
    :reader rvel_target
    :initarg :rvel_target
    :type cl:fixnum
    :initform 0)
   (lvel_target
    :reader lvel_target
    :initarg :lvel_target
    :type cl:fixnum
    :initform 0)
   (led_status
    :reader led_status
    :initarg :led_status
    :type cl:fixnum
    :initform 0)
   (output_1
    :reader output_1
    :initarg :output_1
    :type cl:boolean
    :initform cl:nil)
   (output_2
    :reader output_2
    :initarg :output_2
    :type cl:boolean
    :initform cl:nil)
   (output_3
    :reader output_3
    :initarg :output_3
    :type cl:boolean
    :initform cl:nil)
   (output_4
    :reader output_4
    :initarg :output_4
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Control (<Control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rtcrobot-msg:<Control> is deprecated: use rtcrobot-msg:Control instead.")))

(cl:ensure-generic-function 'rvel_target-val :lambda-list '(m))
(cl:defmethod rvel_target-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:rvel_target-val is deprecated.  Use rtcrobot-msg:rvel_target instead.")
  (rvel_target m))

(cl:ensure-generic-function 'lvel_target-val :lambda-list '(m))
(cl:defmethod lvel_target-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:lvel_target-val is deprecated.  Use rtcrobot-msg:lvel_target instead.")
  (lvel_target m))

(cl:ensure-generic-function 'led_status-val :lambda-list '(m))
(cl:defmethod led_status-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:led_status-val is deprecated.  Use rtcrobot-msg:led_status instead.")
  (led_status m))

(cl:ensure-generic-function 'output_1-val :lambda-list '(m))
(cl:defmethod output_1-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:output_1-val is deprecated.  Use rtcrobot-msg:output_1 instead.")
  (output_1 m))

(cl:ensure-generic-function 'output_2-val :lambda-list '(m))
(cl:defmethod output_2-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:output_2-val is deprecated.  Use rtcrobot-msg:output_2 instead.")
  (output_2 m))

(cl:ensure-generic-function 'output_3-val :lambda-list '(m))
(cl:defmethod output_3-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:output_3-val is deprecated.  Use rtcrobot-msg:output_3 instead.")
  (output_3 m))

(cl:ensure-generic-function 'output_4-val :lambda-list '(m))
(cl:defmethod output_4-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:output_4-val is deprecated.  Use rtcrobot-msg:output_4 instead.")
  (output_4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Control>) ostream)
  "Serializes a message object of type '<Control>"
  (cl:let* ((signed (cl:slot-value msg 'rvel_target)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lvel_target)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'led_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'output_1) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'output_2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'output_3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'output_4) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Control>) istream)
  "Deserializes a message object of type '<Control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rvel_target) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lvel_target) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'led_status) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'output_1) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'output_2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'output_3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'output_4) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Control>)))
  "Returns string type for a message object of type '<Control>"
  "rtcrobot/Control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control)))
  "Returns string type for a message object of type 'Control"
  "rtcrobot/Control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Control>)))
  "Returns md5sum for a message object of type '<Control>"
  "37b8adb76b20d5e3dea76b096f6e65a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Control)))
  "Returns md5sum for a message object of type 'Control"
  "37b8adb76b20d5e3dea76b096f6e65a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Control>)))
  "Returns full string definition for message of type '<Control>"
  (cl:format cl:nil "int16 rvel_target~%int16 lvel_target~%int16 led_status~%~%bool    output_1~%bool    output_2~%bool    output_3~%bool    output_4~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Control)))
  "Returns full string definition for message of type 'Control"
  (cl:format cl:nil "int16 rvel_target~%int16 lvel_target~%int16 led_status~%~%bool    output_1~%bool    output_2~%bool    output_3~%bool    output_4~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Control>))
  (cl:+ 0
     2
     2
     2
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Control>))
  "Converts a ROS message object to a list"
  (cl:list 'Control
    (cl:cons ':rvel_target (rvel_target msg))
    (cl:cons ':lvel_target (lvel_target msg))
    (cl:cons ':led_status (led_status msg))
    (cl:cons ':output_1 (output_1 msg))
    (cl:cons ':output_2 (output_2 msg))
    (cl:cons ':output_3 (output_3 msg))
    (cl:cons ':output_4 (output_4 msg))
))
