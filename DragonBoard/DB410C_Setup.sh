#!/bin/bash

# Update the system
sudo apt-get update

# Upgrade the system
sudo apt-get upgrade -y

# Install some basic packages
sudo apt-get install -y vim git wget curl

# Install the required packages for ArduPilot
sudo apt-get install -y python3-dev python3-opencv python3-wxgtk4.0 python3-pip python3-matplotlib python3-lxml python3-pygame
sudo apt-get install -y python3-scipy python3-gdal python3-numpy

# Clone ArduPilot from GitHub
cd ~
git clone https://github.com/ArduPilot/ardupilot.git
cd ardupilot

# Initialize and update submodules
git submodule update --init --recursive
