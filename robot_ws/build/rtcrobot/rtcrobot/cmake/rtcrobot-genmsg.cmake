# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rtcrobot: 2 messages, 0 services")

set(MSG_I_FLAGS "-Irtcrobot:/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rtcrobot_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg" NAME_WE)
add_custom_target(_rtcrobot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rtcrobot" "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg" ""
)

get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg" NAME_WE)
add_custom_target(_rtcrobot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rtcrobot" "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot
)
_generate_msg_cpp(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot
)

### Generating Services

### Generating Module File
_generate_module_cpp(rtcrobot
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rtcrobot_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rtcrobot_generate_messages rtcrobot_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_cpp _rtcrobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_cpp _rtcrobot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_gencpp)
add_dependencies(rtcrobot_gencpp rtcrobot_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot
)
_generate_msg_eus(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot
)

### Generating Services

### Generating Module File
_generate_module_eus(rtcrobot
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rtcrobot_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rtcrobot_generate_messages rtcrobot_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_eus _rtcrobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_eus _rtcrobot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_geneus)
add_dependencies(rtcrobot_geneus rtcrobot_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot
)
_generate_msg_lisp(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot
)

### Generating Services

### Generating Module File
_generate_module_lisp(rtcrobot
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rtcrobot_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rtcrobot_generate_messages rtcrobot_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_lisp _rtcrobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_lisp _rtcrobot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_genlisp)
add_dependencies(rtcrobot_genlisp rtcrobot_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot
)
_generate_msg_nodejs(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot
)

### Generating Services

### Generating Module File
_generate_module_nodejs(rtcrobot
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rtcrobot_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rtcrobot_generate_messages rtcrobot_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_nodejs _rtcrobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_nodejs _rtcrobot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_gennodejs)
add_dependencies(rtcrobot_gennodejs rtcrobot_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot
)
_generate_msg_py(rtcrobot
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot
)

### Generating Services

### Generating Module File
_generate_module_py(rtcrobot
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rtcrobot_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rtcrobot_generate_messages rtcrobot_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Control.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_py _rtcrobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot/msg/Information.msg" NAME_WE)
add_dependencies(rtcrobot_generate_messages_py _rtcrobot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_genpy)
add_dependencies(rtcrobot_genpy rtcrobot_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rtcrobot_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rtcrobot_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rtcrobot_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(rtcrobot_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rtcrobot_generate_messages_py std_msgs_generate_messages_py)
endif()
