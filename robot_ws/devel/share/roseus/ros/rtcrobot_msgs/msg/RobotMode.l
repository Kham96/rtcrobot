;; Auto-generated. Do not edit!


(when (boundp 'rtcrobot_msgs::RobotMode)
  (if (not (find-package "RTCROBOT_MSGS"))
    (make-package "RTCROBOT_MSGS"))
  (shadow 'RobotMode (find-package "RTCROBOT_MSGS")))
(unless (find-package "RTCROBOT_MSGS::ROBOTMODE")
  (make-package "RTCROBOT_MSGS::ROBOTMODE"))

(in-package "ROS")
;;//! \htmlinclude RobotMode.msg.html


(defclass rtcrobot_msgs::RobotMode
  :super ros::object
  :slots (_code _name ))

(defmethod rtcrobot_msgs::RobotMode
  (:init
   (&key
    ((:code __code) 0)
    ((:name __name) "")
    )
   (send-super :init)
   (setq _code (round __code))
   (setq _name (string __name))
   self)
  (:code
   (&optional __code)
   (if __code (setq _code __code)) _code)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; int8 _code
    1
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _code
       (write-byte _code s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _code
     (setq _code (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _code 127) (setq _code (- _code 256)))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rtcrobot_msgs::RobotMode :md5sum-) "d02f0003881d9ef2396a7f7c3b4db158")
(setf (get rtcrobot_msgs::RobotMode :datatype-) "rtcrobot_msgs/RobotMode")
(setf (get rtcrobot_msgs::RobotMode :definition-)
      "# code of the mode
int8 code

# name of the mode
string name

")



(provide :rtcrobot_msgs/RobotMode "d02f0003881d9ef2396a7f7c3b4db158")


