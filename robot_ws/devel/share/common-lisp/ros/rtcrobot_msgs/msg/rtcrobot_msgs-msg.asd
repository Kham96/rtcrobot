
(cl:in-package :asdf)

(defsystem "rtcrobot_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RobotMode" :depends-on ("_package_RobotMode"))
    (:file "_package_RobotMode" :depends-on ("_package"))
  ))