#!/bin/bash

echo "remap the device serial port(ttyUSBX) to  devices"
echo "rplidar usb connection as /dev/rtcboard , check it using the command : ls -l /dev|grep ttyUSB"
echo "start copy *.rules to  /etc/udev/rules.d/"
echo "`rospack find RTCBoard`/scripts/rtcboard.rules"
sudo cp `rospack find RTCBoard`/scripts/rtcboard.rules  /etc/udev/rules.d
echo "`rospack find RTCBoard`/scripts/rplidar.rules"
sudo cp `rospack find RTCBoard`/scripts/rplidar.rules  /etc/udev/rules.d
echo "`rospack find RTCBoard`/scripts/motordriver.rules"
sudo cp `rospack find RTCBoard`/scripts/motordriver.rules  /etc/udev/rules.d
echo " "
echo "Restarting udev"
echo ""
sudo service udev reload
sudo service udev restart
echo "finish "
