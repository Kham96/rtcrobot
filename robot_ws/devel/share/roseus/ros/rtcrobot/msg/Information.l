;; Auto-generated. Do not edit!


(when (boundp 'rtcrobot::Information)
  (if (not (find-package "RTCROBOT"))
    (make-package "RTCROBOT"))
  (shadow 'Information (find-package "RTCROBOT")))
(unless (find-package "RTCROBOT::INFORMATION")
  (make-package "RTCROBOT::INFORMATION"))

(in-package "ROS")
;;//! \htmlinclude Information.msg.html


(defclass rtcrobot::Information
  :super ros::object
  :slots (_imu_ax _imu_ay _imu_az _imu_gx _imu_gy _imu_gz _imu_mx _imu_my _imu_mz _range_1 _range_2 _input_1 _input_2 _input_3 _input_4 _output_1 _output_2 _output_3 _output_4 ))

(defmethod rtcrobot::Information
  (:init
   (&key
    ((:imu_ax __imu_ax) 0.0)
    ((:imu_ay __imu_ay) 0.0)
    ((:imu_az __imu_az) 0.0)
    ((:imu_gx __imu_gx) 0.0)
    ((:imu_gy __imu_gy) 0.0)
    ((:imu_gz __imu_gz) 0.0)
    ((:imu_mx __imu_mx) 0.0)
    ((:imu_my __imu_my) 0.0)
    ((:imu_mz __imu_mz) 0.0)
    ((:range_1 __range_1) 0.0)
    ((:range_2 __range_2) 0.0)
    ((:input_1 __input_1) nil)
    ((:input_2 __input_2) nil)
    ((:input_3 __input_3) nil)
    ((:input_4 __input_4) nil)
    ((:output_1 __output_1) nil)
    ((:output_2 __output_2) nil)
    ((:output_3 __output_3) nil)
    ((:output_4 __output_4) nil)
    )
   (send-super :init)
   (setq _imu_ax (float __imu_ax))
   (setq _imu_ay (float __imu_ay))
   (setq _imu_az (float __imu_az))
   (setq _imu_gx (float __imu_gx))
   (setq _imu_gy (float __imu_gy))
   (setq _imu_gz (float __imu_gz))
   (setq _imu_mx (float __imu_mx))
   (setq _imu_my (float __imu_my))
   (setq _imu_mz (float __imu_mz))
   (setq _range_1 (float __range_1))
   (setq _range_2 (float __range_2))
   (setq _input_1 __input_1)
   (setq _input_2 __input_2)
   (setq _input_3 __input_3)
   (setq _input_4 __input_4)
   (setq _output_1 __output_1)
   (setq _output_2 __output_2)
   (setq _output_3 __output_3)
   (setq _output_4 __output_4)
   self)
  (:imu_ax
   (&optional __imu_ax)
   (if __imu_ax (setq _imu_ax __imu_ax)) _imu_ax)
  (:imu_ay
   (&optional __imu_ay)
   (if __imu_ay (setq _imu_ay __imu_ay)) _imu_ay)
  (:imu_az
   (&optional __imu_az)
   (if __imu_az (setq _imu_az __imu_az)) _imu_az)
  (:imu_gx
   (&optional __imu_gx)
   (if __imu_gx (setq _imu_gx __imu_gx)) _imu_gx)
  (:imu_gy
   (&optional __imu_gy)
   (if __imu_gy (setq _imu_gy __imu_gy)) _imu_gy)
  (:imu_gz
   (&optional __imu_gz)
   (if __imu_gz (setq _imu_gz __imu_gz)) _imu_gz)
  (:imu_mx
   (&optional __imu_mx)
   (if __imu_mx (setq _imu_mx __imu_mx)) _imu_mx)
  (:imu_my
   (&optional __imu_my)
   (if __imu_my (setq _imu_my __imu_my)) _imu_my)
  (:imu_mz
   (&optional __imu_mz)
   (if __imu_mz (setq _imu_mz __imu_mz)) _imu_mz)
  (:range_1
   (&optional __range_1)
   (if __range_1 (setq _range_1 __range_1)) _range_1)
  (:range_2
   (&optional __range_2)
   (if __range_2 (setq _range_2 __range_2)) _range_2)
  (:input_1
   (&optional __input_1)
   (if __input_1 (setq _input_1 __input_1)) _input_1)
  (:input_2
   (&optional __input_2)
   (if __input_2 (setq _input_2 __input_2)) _input_2)
  (:input_3
   (&optional __input_3)
   (if __input_3 (setq _input_3 __input_3)) _input_3)
  (:input_4
   (&optional __input_4)
   (if __input_4 (setq _input_4 __input_4)) _input_4)
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
    ;; float32 _imu_ax
    4
    ;; float32 _imu_ay
    4
    ;; float32 _imu_az
    4
    ;; float32 _imu_gx
    4
    ;; float32 _imu_gy
    4
    ;; float32 _imu_gz
    4
    ;; float32 _imu_mx
    4
    ;; float32 _imu_my
    4
    ;; float32 _imu_mz
    4
    ;; float32 _range_1
    4
    ;; float32 _range_2
    4
    ;; bool _input_1
    1
    ;; bool _input_2
    1
    ;; bool _input_3
    1
    ;; bool _input_4
    1
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
     ;; float32 _imu_ax
       (sys::poke _imu_ax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imu_ay
       (sys::poke _imu_ay (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imu_az
       (sys::poke _imu_az (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imu_gx
       (sys::poke _imu_gx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imu_gy
       (sys::poke _imu_gy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imu_gz
       (sys::poke _imu_gz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imu_mx
       (sys::poke _imu_mx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imu_my
       (sys::poke _imu_my (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _imu_mz
       (sys::poke _imu_mz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _range_1
       (sys::poke _range_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _range_2
       (sys::poke _range_2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _input_1
       (if _input_1 (write-byte -1 s) (write-byte 0 s))
     ;; bool _input_2
       (if _input_2 (write-byte -1 s) (write-byte 0 s))
     ;; bool _input_3
       (if _input_3 (write-byte -1 s) (write-byte 0 s))
     ;; bool _input_4
       (if _input_4 (write-byte -1 s) (write-byte 0 s))
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
   ;; float32 _imu_ax
     (setq _imu_ax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imu_ay
     (setq _imu_ay (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imu_az
     (setq _imu_az (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imu_gx
     (setq _imu_gx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imu_gy
     (setq _imu_gy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imu_gz
     (setq _imu_gz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imu_mx
     (setq _imu_mx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imu_my
     (setq _imu_my (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _imu_mz
     (setq _imu_mz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _range_1
     (setq _range_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _range_2
     (setq _range_2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _input_1
     (setq _input_1 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _input_2
     (setq _input_2 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _input_3
     (setq _input_3 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _input_4
     (setq _input_4 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
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

(setf (get rtcrobot::Information :md5sum-) "51b071e47da4f36ad37e1ffa8c219c91")
(setf (get rtcrobot::Information :datatype-) "rtcrobot/Information")
(setf (get rtcrobot::Information :definition-)
      "float32 imu_ax
float32 imu_ay
float32 imu_az
float32 imu_gx
float32 imu_gy
float32 imu_gz
float32 imu_mx
float32 imu_my
float32 imu_mz

float32 range_1
float32 range_2

bool    input_1
bool    input_2
bool    input_3
bool    input_4

bool    output_1
bool    output_2
bool    output_3
bool    output_4
")



(provide :rtcrobot/Information "51b071e47da4f36ad37e1ffa8c219c91")


