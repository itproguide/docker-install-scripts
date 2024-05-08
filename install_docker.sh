#!/bin/bash

# Update the system
echo "Updating the system..."
sudo apt-get update

# Install required packages
echo "Installing required packages..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository
echo "Setting up the Docker stable repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the apt package index
echo "Updating the apt package index..."
sudo apt-get update

# Install Docker CE
echo "Installing Docker CE..."
sudo apt-get install -y docker-ce

# Verify Docker Installation by running the hello-world container
echo "Running the 'hello-world' container to verify installation..."
sudo docker run hello-world

# Manage Docker as a non-root user
echo "Adding current user to the Docker group..."
sudo usermod -aG docker ${USER}

# Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

echo "Docker installation is complete. Please log out and back in for group changes to take effect."
