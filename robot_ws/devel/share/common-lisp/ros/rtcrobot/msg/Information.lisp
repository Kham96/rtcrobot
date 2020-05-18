; Auto-generated. Do not edit!


(cl:in-package rtcrobot-msg)


;//! \htmlinclude Information.msg.html

(cl:defclass <Information> (roslisp-msg-protocol:ros-message)
  ((imu_ax
    :reader imu_ax
    :initarg :imu_ax
    :type cl:float
    :initform 0.0)
   (imu_ay
    :reader imu_ay
    :initarg :imu_ay
    :type cl:float
    :initform 0.0)
   (imu_az
    :reader imu_az
    :initarg :imu_az
    :type cl:float
    :initform 0.0)
   (imu_gx
    :reader imu_gx
    :initarg :imu_gx
    :type cl:float
    :initform 0.0)
   (imu_gy
    :reader imu_gy
    :initarg :imu_gy
    :type cl:float
    :initform 0.0)
   (imu_gz
    :reader imu_gz
    :initarg :imu_gz
    :type cl:float
    :initform 0.0)
   (imu_mx
    :reader imu_mx
    :initarg :imu_mx
    :type cl:float
    :initform 0.0)
   (imu_my
    :reader imu_my
    :initarg :imu_my
    :type cl:float
    :initform 0.0)
   (imu_mz
    :reader imu_mz
    :initarg :imu_mz
    :type cl:float
    :initform 0.0)
   (range_1
    :reader range_1
    :initarg :range_1
    :type cl:float
    :initform 0.0)
   (range_2
    :reader range_2
    :initarg :range_2
    :type cl:float
    :initform 0.0)
   (input_1
    :reader input_1
    :initarg :input_1
    :type cl:boolean
    :initform cl:nil)
   (input_2
    :reader input_2
    :initarg :input_2
    :type cl:boolean
    :initform cl:nil)
   (input_3
    :reader input_3
    :initarg :input_3
    :type cl:boolean
    :initform cl:nil)
   (input_4
    :reader input_4
    :initarg :input_4
    :type cl:boolean
    :initform cl:nil)
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

(cl:defclass Information (<Information>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Information>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Information)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rtcrobot-msg:<Information> is deprecated: use rtcrobot-msg:Information instead.")))

(cl:ensure-generic-function 'imu_ax-val :lambda-list '(m))
(cl:defmethod imu_ax-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_ax-val is deprecated.  Use rtcrobot-msg:imu_ax instead.")
  (imu_ax m))

(cl:ensure-generic-function 'imu_ay-val :lambda-list '(m))
(cl:defmethod imu_ay-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_ay-val is deprecated.  Use rtcrobot-msg:imu_ay instead.")
  (imu_ay m))

(cl:ensure-generic-function 'imu_az-val :lambda-list '(m))
(cl:defmethod imu_az-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_az-val is deprecated.  Use rtcrobot-msg:imu_az instead.")
  (imu_az m))

(cl:ensure-generic-function 'imu_gx-val :lambda-list '(m))
(cl:defmethod imu_gx-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_gx-val is deprecated.  Use rtcrobot-msg:imu_gx instead.")
  (imu_gx m))

(cl:ensure-generic-function 'imu_gy-val :lambda-list '(m))
(cl:defmethod imu_gy-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_gy-val is deprecated.  Use rtcrobot-msg:imu_gy instead.")
  (imu_gy m))

(cl:ensure-generic-function 'imu_gz-val :lambda-list '(m))
(cl:defmethod imu_gz-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_gz-val is deprecated.  Use rtcrobot-msg:imu_gz instead.")
  (imu_gz m))

(cl:ensure-generic-function 'imu_mx-val :lambda-list '(m))
(cl:defmethod imu_mx-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_mx-val is deprecated.  Use rtcrobot-msg:imu_mx instead.")
  (imu_mx m))

(cl:ensure-generic-function 'imu_my-val :lambda-list '(m))
(cl:defmethod imu_my-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_my-val is deprecated.  Use rtcrobot-msg:imu_my instead.")
  (imu_my m))

(cl:ensure-generic-function 'imu_mz-val :lambda-list '(m))
(cl:defmethod imu_mz-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:imu_mz-val is deprecated.  Use rtcrobot-msg:imu_mz instead.")
  (imu_mz m))

(cl:ensure-generic-function 'range_1-val :lambda-list '(m))
(cl:defmethod range_1-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:range_1-val is deprecated.  Use rtcrobot-msg:range_1 instead.")
  (range_1 m))

(cl:ensure-generic-function 'range_2-val :lambda-list '(m))
(cl:defmethod range_2-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:range_2-val is deprecated.  Use rtcrobot-msg:range_2 instead.")
  (range_2 m))

(cl:ensure-generic-function 'input_1-val :lambda-list '(m))
(cl:defmethod input_1-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:input_1-val is deprecated.  Use rtcrobot-msg:input_1 instead.")
  (input_1 m))

(cl:ensure-generic-function 'input_2-val :lambda-list '(m))
(cl:defmethod input_2-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:input_2-val is deprecated.  Use rtcrobot-msg:input_2 instead.")
  (input_2 m))

(cl:ensure-generic-function 'input_3-val :lambda-list '(m))
(cl:defmethod input_3-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:input_3-val is deprecated.  Use rtcrobot-msg:input_3 instead.")
  (input_3 m))

(cl:ensure-generic-function 'input_4-val :lambda-list '(m))
(cl:defmethod input_4-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:input_4-val is deprecated.  Use rtcrobot-msg:input_4 instead.")
  (input_4 m))

(cl:ensure-generic-function 'output_1-val :lambda-list '(m))
(cl:defmethod output_1-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:output_1-val is deprecated.  Use rtcrobot-msg:output_1 instead.")
  (output_1 m))

(cl:ensure-generic-function 'output_2-val :lambda-list '(m))
(cl:defmethod output_2-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:output_2-val is deprecated.  Use rtcrobot-msg:output_2 instead.")
  (output_2 m))

(cl:ensure-generic-function 'output_3-val :lambda-list '(m))
(cl:defmethod output_3-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:output_3-val is deprecated.  Use rtcrobot-msg:output_3 instead.")
  (output_3 m))

(cl:ensure-generic-function 'output_4-val :lambda-list '(m))
(cl:defmethod output_4-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtcrobot-msg:output_4-val is deprecated.  Use rtcrobot-msg:output_4 instead.")
  (output_4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Information>) ostream)
  "Serializes a message object of type '<Information>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_ax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_ay))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_az))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_gx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_gy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_gz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_mx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_my))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imu_mz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'input_1) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'input_2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'input_3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'input_4) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'output_1) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'output_2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'output_3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'output_4) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Information>) istream)
  "Deserializes a message object of type '<Information>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_ax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_ay) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_az) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_gx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_gy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_gz) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_mx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_my) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_mz) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range_2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'input_1) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'input_2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'input_3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'input_4) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'output_1) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'output_2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'output_3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'output_4) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Information>)))
  "Returns string type for a message object of type '<Information>"
  "rtcrobot/Information")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Information)))
  "Returns string type for a message object of type 'Information"
  "rtcrobot/Information")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Information>)))
  "Returns md5sum for a message object of type '<Information>"
  "51b071e47da4f36ad37e1ffa8c219c91")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Information)))
  "Returns md5sum for a message object of type 'Information"
  "51b071e47da4f36ad37e1ffa8c219c91")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Information>)))
  "Returns full string definition for message of type '<Information>"
  (cl:format cl:nil "float32 imu_ax~%float32 imu_ay~%float32 imu_az~%float32 imu_gx~%float32 imu_gy~%float32 imu_gz~%float32 imu_mx~%float32 imu_my~%float32 imu_mz~%~%float32 range_1~%float32 range_2~%~%bool    input_1~%bool    input_2~%bool    input_3~%bool    input_4~%~%bool    output_1~%bool    output_2~%bool    output_3~%bool    output_4~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Information)))
  "Returns full string definition for message of type 'Information"
  (cl:format cl:nil "float32 imu_ax~%float32 imu_ay~%float32 imu_az~%float32 imu_gx~%float32 imu_gy~%float32 imu_gz~%float32 imu_mx~%float32 imu_my~%float32 imu_mz~%~%float32 range_1~%float32 range_2~%~%bool    input_1~%bool    input_2~%bool    input_3~%bool    input_4~%~%bool    output_1~%bool    output_2~%bool    output_3~%bool    output_4~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Information>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Information>))
  "Converts a ROS message object to a list"
  (cl:list 'Information
    (cl:cons ':imu_ax (imu_ax msg))
    (cl:cons ':imu_ay (imu_ay msg))
    (cl:cons ':imu_az (imu_az msg))
    (cl:cons ':imu_gx (imu_gx msg))
    (cl:cons ':imu_gy (imu_gy msg))
    (cl:cons ':imu_gz (imu_gz msg))
    (cl:cons ':imu_mx (imu_mx msg))
    (cl:cons ':imu_my (imu_my msg))
    (cl:cons ':imu_mz (imu_mz msg))
    (cl:cons ':range_1 (range_1 msg))
    (cl:cons ':range_2 (range_2 msg))
    (cl:cons ':input_1 (input_1 msg))
    (cl:cons ':input_2 (input_2 msg))
    (cl:cons ':input_3 (input_3 msg))
    (cl:cons ':input_4 (input_4 msg))
    (cl:cons ':output_1 (output_1 msg))
    (cl:cons ':output_2 (output_2 msg))
    (cl:cons ':output_3 (output_3 msg))
    (cl:cons ':output_4 (output_4 msg))
))
