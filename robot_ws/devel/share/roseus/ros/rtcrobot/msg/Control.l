;; Auto-generated. Do not edit!


(when (boundp 'rtcrobot::Control)
  (if (not (find-package "RTCROBOT"))
    (make-package "RTCROBOT"))
  (shadow 'Control (find-package "RTCROBOT")))
(unless (find-package "RTCROBOT::CONTROL")
  (make-package "RTCROBOT::CONTROL"))

(in-package "ROS")
;;//! \htmlinclude Control.msg.html


(defclass rtcrobot::Control
  :super ros::object
  :slots (_rvel_target _lvel_target _led_status _output_1 _output_2 _output_3 _output_4 ))

(defmethod rtcrobot::Control
  (:init
   (&key
    ((:rvel_target __rvel_target) 0)
    ((:lvel_target __lvel_target) 0)
    ((:led_status __led_status) 0)
    ((:output_1 __output_1) nil)
    ((:output_2 __output_2) nil)
    ((:output_3 __output_3) nil)
    ((:output_4 __output_4) nil)
    )
   (send-super :init)
   (setq _rvel_target (round __rvel_target))
   (setq _lvel_target (round __lvel_target))
   (setq _led_status (round __led_status))
   (setq _output_1 __output_1)
   (setq _output_2 __output_2)
   (setq _output_3 __output_3)
   (setq _output_4 __output_4)
   self)
  (:rvel_target
   (&optional __rvel_target)
   (if __rvel_target (setq _rvel_target __rvel_target)) _rvel_target)
  (:lvel_target
   (&optional __lvel_target)
   (if __lvel_target (setq _lvel_target __lvel_target)) _lvel_target)
  (:led_status
   (&optional __led_status)
   (if __led_status (setq _led_status __led_status)) _led_status)
  (:output_1
   (&optional __output_1)
   (if __output_1 (setq _output_1 __output_1)) _output_1)
  (:output_2
   (&optional __output_2)
   (if __output_2 (setq _output_2 __output_2)) _output_2)
  (:output_3
   (&optional __output_3)
   (if __output_3 (setq _output_3 __output_3)) _output_3)
  (:output_4
   (&optional __output_4)
   (if __output_4 (setq _output_4 __output_4)) _output_4)
  (:serialization-length
   ()
   (+
    ;; int16 _rvel_target
    2
    ;; int16 _lvel_target
    2
    ;; int16 _led_status
    2
    ;; bool _output_1
    1
    ;; bool _output_2
    1
    ;; bool _output_3
    1
    ;; bool _output_4
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _rvel_target
       (write-word _rvel_target s)
     ;; int16 _lvel_target
       (write-word _lvel_target s)
     ;; int16 _led_status
       (write-word _led_status s)
     ;; bool _output_1
       (if _output_1 (write-byte -1 s) (write-byte 0 s))
     ;; bool _output_2
       (if _output_2 (write-byte -1 s) (write-byte 0 s))
     ;; bool _output_3
       (if _output_3 (write-byte -1 s) (write-byte 0 s))
     ;; bool _output_4
       (if _output_4 (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _rvel_target
     (setq _rvel_target (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _lvel_target
     (setq _lvel_target (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _led_status
     (setq _led_status (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _output_1
     (setq _output_1 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _output_2
     (setq _output_2 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _output_3
     (setq _output_3 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _output_4
     (setq _output_4 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rtcrobot::Control :md5sum-) "37b8adb76b20d5e3dea76b096f6e65a0")
(setf (get rtcrobot::Control :datatype-) "rtcrobot/Control")
(setf (get rtcrobot::Control :definition-)
      "int16 rvel_target
int16 lvel_target
int16 led_status

bool    output_1
bool    output_2
bool    output_3
bool    output_4
")



(provide :rtcrobot/Control "37b8adb76b20d5e3dea76b096f6e65a0")


