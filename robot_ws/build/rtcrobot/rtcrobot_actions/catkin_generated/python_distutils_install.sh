#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_actions"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/gaara/robot_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/gaara/robot_ws/install/lib/python2.7/dist-packages:/home/gaara/robot_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/gaara/robot_ws/build" \
    "/usr/bin/python2" \
    "/home/gaara/robot_ws/src/rtcrobot/rtcrobot_actions/setup.py" \
    build --build-base "/home/gaara/robot_ws/build/rtcrobot/rtcrobot_actions" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/gaara/robot_ws/install" --install-scripts="/home/gaara/robot_ws/install/bin"
