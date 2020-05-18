;; Auto-generated. Do not edit!


(when (boundp 'rtcrobot_services::SaveMap)
  (if (not (find-package "RTCROBOT_SERVICES"))
    (make-package "RTCROBOT_SERVICES"))
  (shadow 'SaveMap (find-package "RTCROBOT_SERVICES")))
(unless (find-package "RTCROBOT_SERVICES::SAVEMAP")
  (make-package "RTCROBOT_SERVICES::SAVEMAP"))
(unless (find-package "RTCROBOT_SERVICES::SAVEMAPREQUEST")
  (make-package "RTCROBOT_SERVICES::SAVEMAPREQUEST"))
(unless (find-package "RTCROBOT_SERVICES::SAVEMAPRESPONSE")
  (make-package "RTCROBOT_SERVICES::SAVEMAPRESPONSE"))

(in-package "ROS")





(defclass rtcrobot_services::SaveMapRequest
  :super ros::object
  :slots (_name _description ))

(defmethod rtcrobot_services::SaveMapRequest
  (:init
   (&key
    ((:name __name) "")
    ((:description __description) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _description (string __description))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:description
   (&optional __description)
   (if __description (setq _description __description)) _description)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _description
    4 (length _description)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _description
       (write-long (length _description) s) (princ _description s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass rtcrobot_services::SaveMapResponse
  :super ros::object
  :slots ())

(defmethod rtcrobot_services::SaveMapResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass rtcrobot_services::SaveMap
  :super ros::object
  :slots ())

(setf (get rtcrobot_services::SaveMap :md5sum-) "5a319d5d0d68cf65447a451755dbc01b")
(setf (get rtcrobot_services::SaveMap :datatype-) "rtcrobot_services/SaveMap")
(setf (get rtcrobot_services::SaveMap :request) rtcrobot_services::SaveMapRequest)
(setf (get rtcrobot_services::SaveMap :response) rtcrobot_services::SaveMapResponse)

(defmethod rtcrobot_services::SaveMapRequest
  (:response () (instance rtcrobot_services::SaveMapResponse :init)))

(setf (get rtcrobot_services::SaveMapRequest :md5sum-) "5a319d5d0d68cf65447a451755dbc01b")
(setf (get rtcrobot_services::SaveMapRequest :datatype-) "rtcrobot_services/SaveMapRequest")
(setf (get rtcrobot_services::SaveMapRequest :definition-)
      "string name
string description
---
")

(setf (get rtcrobot_services::SaveMapResponse :md5sum-) "5a319d5d0d68cf65447a451755dbc01b")
(setf (get rtcrobot_services::SaveMapResponse :datatype-) "rtcrobot_services/SaveMapResponse")
(setf (get rtcrobot_services::SaveMapResponse :definition-)
      "string name
string description
---
")



(provide :rtcrobot_services/SaveMap "5a319d5d0d68cf65447a451755dbc01b")


