#!/bin/bash

# Start the X server
sudo service lightdm stop
sudo xinit &

# This should not be needed!
sudo nvidia-docker-plugin &
# TRY:
# https://github.com/NVIDIA/nvidia-docker/issues/116
# sudo apt-get purge nvidia-docker
# sudo rm -r /var/lib/nvidia-docker

# Start the server on port 5901
/opt/TurboVNC/bin/vncserver

# If you wish to run noVNC
# /opt/noVNC/utils/launch.sh --vnc localhost:5901
