;; Auto-generated. Do not edit!


(when (boundp 'rtcrobot_actions::MissionFeedback)
  (if (not (find-package "RTCROBOT_ACTIONS"))
    (make-package "RTCROBOT_ACTIONS"))
  (shadow 'MissionFeedback (find-package "RTCROBOT_ACTIONS")))
(unless (find-package "RTCROBOT_ACTIONS::MISSIONFEEDBACK")
  (make-package "RTCROBOT_ACTIONS::MISSIONFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude MissionFeedback.msg.html


(defclass rtcrobot_actions::MissionFeedback
  :super ros::object
  :slots (_status _mission_name ))

(defmethod rtcrobot_actions::MissionFeedback
  (:init
   (&key
    ((:status __status) "")
    ((:mission_name __mission_name) "")
    )
   (send-super :init)
   (setq _status (string __status))
   (setq _mission_name (string __mission_name))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:mission_name
   (&optional __mission_name)
   (if __mission_name (setq _mission_name __mission_name)) _mission_name)
  (:serialization-length
   ()
   (+
    ;; string _status
    4 (length _status)
    ;; string _mission_name
    4 (length _mission_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;; string _mission_name
       (write-long (length _mission_name) s) (princ _mission_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _mission_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mission_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rtcrobot_actions::MissionFeedback :md5sum-) "0a7e12fdec1796b54ca6a5b259cdbe32")
(setf (get rtcrobot_actions::MissionFeedback :datatype-) "rtcrobot_actions/MissionFeedback")
(setf (get rtcrobot_actions::MissionFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Define a feedback message
# Status
string status

string mission_name


")



(provide :rtcrobot_actions/MissionFeedback "0a7e12fdec1796b54ca6a5b259cdbe32")

