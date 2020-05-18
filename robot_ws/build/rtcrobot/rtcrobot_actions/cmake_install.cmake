# Install script for directory: /home/gaara/robot_ws/src/rtcrobot/rtcrobot_actions

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/gaara/robot_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/gaara/robot_ws/build/rtcrobot/rtcrobot_actions/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rtcrobot_actions/action" TYPE FILE FILES
    "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_actions/action/Dock.action"
    "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_actions/action/SaveMap.action"
    "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_actions/action/Mission.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rtcrobot_actions/msg" TYPE FILE FILES
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/DockAction.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/DockActionGoal.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/DockActionResult.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/DockActionFeedback.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/DockGoal.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/DockResult.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/DockFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rtcrobot_actions/msg" TYPE FILE FILES
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/SaveMapAction.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/SaveMapActionGoal.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/SaveMapActionResult.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/SaveMapActionFeedback.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/SaveMapGoal.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/SaveMapResult.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/SaveMapFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rtcrobot_actions/msg" TYPE FILE FILES
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/MissionAction.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/MissionActionGoal.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/MissionActionResult.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/MissionActionFeedback.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/MissionGoal.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/MissionResult.msg"
    "/home/gaara/robot_ws/devel/share/rtcrobot_actions/msg/MissionFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rtcrobot_actions/cmake" TYPE FILE FILES "/home/gaara/robot_ws/build/rtcrobot/rtcrobot_actions/catkin_generated/installspace/rtcrobot_actions-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/gaara/robot_ws/devel/include/rtcrobot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/gaara/robot_ws/devel/share/roseus/ros/rtcrobot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/gaara/robot_ws/devel/share/common-lisp/ros/rtcrobot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/gaara/robot_ws/devel/share/gennodejs/ros/rtcrobot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/gaara/robot_ws/devel/lib/python2.7/dist-packages/rtcrobot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/gaara/robot_ws/devel/lib/python2.7/dist-packages/rtcrobot_actions" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/gaara/robot_ws/devel/lib/python2.7/dist-packages/rtcrobot_actions" FILES_MATCHING REGEX "/home/gaara/robot_ws/devel/lib/python2.7/dist-packages/rtcrobot_actions/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/gaara/robot_ws/build/rtcrobot/rtcrobot_actions/catkin_generated/installspace/rtcrobot_actions.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rtcrobot_actions/cmake" TYPE FILE FILES "/home/gaara/robot_ws/build/rtcrobot/rtcrobot_actions/catkin_generated/installspace/rtcrobot_actions-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rtcrobot_actions/cmake" TYPE FILE FILES
    "/home/gaara/robot_ws/build/rtcrobot/rtcrobot_actions/catkin_generated/installspace/rtcrobot_actionsConfig.cmake"
    "/home/gaara/robot_ws/build/rtcrobot/rtcrobot_actions/catkin_generated/installspace/rtcrobot_actionsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rtcrobot_actions" TYPE FILE FILES "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_actions/package.xml")
endif()

