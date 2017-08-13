#!/bin/bash

# Install Docker CE Stable
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Verify that the key fingerprint is 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
# sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# Give the ubuntu user the right to launch containers
sudo usermod -a -G docker ubuntu

# Install nvidia-docker
wget https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb && \
sudo dpkg -i nvidia-docker*.deb && \
rm -f nvidia-docker*.deb

# Cleanup
sudo apt-get clean && \
sudo apt-get autoremove && \
sudo rm -r /var/lib/apt/lists/*

echo ""
echo "******************************************************************"
echo "*                                                                *"
echo "* Logging out for changes to take effect!                        *"
echo "*                                                                *"
echo "******************************************************************"
echo ""

exit
