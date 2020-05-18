
(cl:in-package :asdf)

(defsystem "rtcrobot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Control" :depends-on ("_package_Control"))
    (:file "_package_Control" :depends-on ("_package"))
    (:file "Information" :depends-on ("_package_Information"))
    (:file "_package_Information" :depends-on ("_package"))
    (:file "Num" :depends-on ("_package_Num"))
    (:file "_package_Num" :depends-on ("_package"))
    (:file "person" :depends-on ("_package_person"))
    (:file "_package_person" :depends-on ("_package"))
  ))