execute_process(COMMAND "/home/gaara/robot_ws/src/build/rtcrobot/rtcrobot_services/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/gaara/robot_ws/src/build/rtcrobot/rtcrobot_services/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
