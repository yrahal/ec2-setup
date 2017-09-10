#!/bin/bash

# Start the X server
sudo service lightdm stop
sudo xinit &

# Start the server on port 5901
/opt/TurboVNC/bin/vncserver
if [[ $? -ne 0 ]] ; then
  exit 1
fi

# This should not be needed!
sudo nvidia-docker-plugin &
# TRY:
# https://github.com/NVIDIA/nvidia-docker/issues/116
# sudo apt-get purge nvidia-docker
# sudo rm -r /var/lib/nvidia-docker

# If you wish to run noVNC
# /opt/noVNC/utils/launch.sh --vnc localhost:5901
