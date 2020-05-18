# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rtcrobot_services: 0 messages, 1 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rtcrobot_services_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv" NAME_WE)
add_custom_target(_rtcrobot_services_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rtcrobot_services" "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(rtcrobot_services
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot_services
)

### Generating Module File
_generate_module_cpp(rtcrobot_services
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot_services
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rtcrobot_services_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rtcrobot_services_generate_messages rtcrobot_services_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv" NAME_WE)
add_dependencies(rtcrobot_services_generate_messages_cpp _rtcrobot_services_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_services_gencpp)
add_dependencies(rtcrobot_services_gencpp rtcrobot_services_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_services_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(rtcrobot_services
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot_services
)

### Generating Module File
_generate_module_eus(rtcrobot_services
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot_services
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rtcrobot_services_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rtcrobot_services_generate_messages rtcrobot_services_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv" NAME_WE)
add_dependencies(rtcrobot_services_generate_messages_eus _rtcrobot_services_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_services_geneus)
add_dependencies(rtcrobot_services_geneus rtcrobot_services_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_services_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(rtcrobot_services
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot_services
)

### Generating Module File
_generate_module_lisp(rtcrobot_services
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot_services
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rtcrobot_services_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rtcrobot_services_generate_messages rtcrobot_services_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv" NAME_WE)
add_dependencies(rtcrobot_services_generate_messages_lisp _rtcrobot_services_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_services_genlisp)
add_dependencies(rtcrobot_services_genlisp rtcrobot_services_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_services_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(rtcrobot_services
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot_services
)

### Generating Module File
_generate_module_nodejs(rtcrobot_services
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot_services
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rtcrobot_services_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rtcrobot_services_generate_messages rtcrobot_services_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv" NAME_WE)
add_dependencies(rtcrobot_services_generate_messages_nodejs _rtcrobot_services_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_services_gennodejs)
add_dependencies(rtcrobot_services_gennodejs rtcrobot_services_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_services_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(rtcrobot_services
  "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot_services
)

### Generating Module File
_generate_module_py(rtcrobot_services
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot_services
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rtcrobot_services_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rtcrobot_services_generate_messages rtcrobot_services_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_services/srv/SaveMap.srv" NAME_WE)
add_dependencies(rtcrobot_services_generate_messages_py _rtcrobot_services_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rtcrobot_services_genpy)
add_dependencies(rtcrobot_services_genpy rtcrobot_services_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rtcrobot_services_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot_services)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rtcrobot_services
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot_services)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rtcrobot_services
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot_services)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rtcrobot_services
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot_services)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rtcrobot_services
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot_services)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot_services\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot_services
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot_services
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rtcrobot_services/.+/__init__.pyc?$"
  )
endif()
