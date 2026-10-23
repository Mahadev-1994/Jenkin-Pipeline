#!/bin/bash
set -e

# Update system packages
sudo dnf update -y

# Install Java 21
sudo dnf install -y java-21-amazon-corretto

# Verify Java
java -version

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
  https://pkg.jenkins.io/rpm/jenkins.repo

# Import Jenkins GPG key
sudo rpm --import https://pkg.jenkins.io/rpm/jenkins.io-2023.key

# Install Jenkins
sudo dnf install -y jenkins

# Enable and start Jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
