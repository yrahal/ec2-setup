#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

# Install Lubuntu
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y lubuntu-desktop

# xterm is needed for xinit
sudo apt-get install -y xterm

# Install VirtualGL
wget https://sourceforge.net/projects/virtualgl/files/2.5.2/virtualgl_2.5.2_amd64.deb/download -O virtualgl_2.5.2_amd64.deb && \
sudo dpkg -i virtualgl*.deb && \
rm virtualgl*.deb

# Install TurboVNC
wget https://sourceforge.net/projects/turbovnc/files/2.1.1/turbovnc_2.1.1_amd64.deb/download -O turbovnc_2.1.1_amd64.deb && \
sudo dpkg -i turbovnc*.deb && \
rm turbovnc*.deb

# Install noVNC
sudo git clone https://github.com/novnc/noVNC /opt/noVNC && \
sudo git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# Configure VirtualGL
sudo /etc/init.d/lightdm stop
sudo /opt/VirtualGL/bin/vglserver_config -config +s +f -t
#sudo /etc/init.d/lightdm start

# Instead of exit - we'll update kernel and headers to prepare for Nvidia drivers install.
sudo apt-get install -y gcc linux-headers-$(uname -r)
sudo apt-get upgrade -y linux-aws

# Cleanup
sudo apt-get clean && \
sudo apt-get autoremove && \
sudo rm -r /var/lib/apt/lists/*

# Add aliases
echo "alias cp=\"cp -i\"" >> ~/.bash_aliases
echo "alias mv=\"mv -i\"" >> ~/.bash_aliases
echo "alias rm=\"rm -i\"" >> ~/.bash_aliases

echo ""
echo "******************************************************************"
echo "*                                                                *"
echo "* Rebooting for changes to take effect!                          *"
echo "*                                                                *"
echo "******************************************************************"
echo ""

sudo reboot
