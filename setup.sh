#!/bin/bash

# DevOps Assignment Setup Script
# This script prepares the EC2 instance for the application deployment.

echo "Starting deployment setup..."

# 1. Update system packages (Check 03)
echo "Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# 2. Install Docker if not present (Check 01, 02)
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    echo "Docker installed successfully."
else
    echo "Docker is already installed."
fi

# 3. Install Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "Installing Docker Compose..."
    sudo apt-get install -y docker-compose
fi

# 4. Build and start the containers (Check 04, 05, 06, 07, 08, 09, 10)
echo "Starting application containers..."
sudo docker-compose up -d --build

echo "Deployment complete!"
echo "The application should be accessible at http://localhost"
sudo docker ps
