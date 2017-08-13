#!/bin/bash

# For g2 instance:
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/367.106/NVIDIA-Linux-x86_64-367.106.run
sudo service lightdm stop
sudo /bin/bash NVIDIA-*.run --no-questions --run-nvidia-xconfig
rm -f *.run

# Edit /etc/X11/xorg.conf - See https://stackoverflow.com/questions/34805794/virtualgl-and-turbovnc-extension-glx-missing-on-display-0-0
# sudo nano /etc/X11/xorg.conf
# And under the "Device" section:
# BusID          "0:3:0"
# So must add under the "Screen" section:
# Option         "UseDisplayDevice" "none"

sudo awk '/VendorName     \"NVIDIA Corporation\"/{print;print "    BusID          \"0:3:0\"";next}1' /etc/X11/xorg.conf > tmp && \
sudo mv tmp /etc/X11/xorg.conf
sudo awk '/DefaultDepth    24/{print;print "    Option        \"UseDisplayDevice\" \"none\"";next}1' /etc/X11/xorg.conf > tmp && \
sudo mv tmp /etc/X11/xorg.conf

echo ""
echo "******************************************************************"
echo "*                                                                *"
echo "* Rebooting for changes to take effect!                          *"
echo "*                                                                *"
echo "******************************************************************"
echo ""

sudo reboot
