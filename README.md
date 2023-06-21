
# OSCARs Drone

Code repository for an Open Source, Cost-effective, and Autonomous Remote sensing Drone (OSCARs Drone). Affectionately referred to as 'Oscar the spider'. This guide will walk you through the steps of setting up an autonomous drone using a PixHawk flight controller, DragonBoard 410C, MAVProxy, and ArduPilot running on Debian Ubuntu.

## Hardware Requirements

1. PixHawk flight controller
2. DragonBoard 410C
3. USB to micro-USB cable or TTL converter

## Software Requirements

1. [ArduPilot](https://ardupilot.org/)
2. [MAVProxy](https://ardupilot.org/mavproxy/)
3. Debian Ubuntu OS on DragonBoard 410C

## Step-by-Step Guide

Before you begin, you will need to load an OS (Debian Ubuntu) onto the DragonBoard 410C. 

## [DragonBoard Setup](https://github.com/jpocon/OSCARs_Drone/Drone/DB410C_Setup.md/)

Once you have Ubuntu loaded onto the DragonBoard, we can download the necessary packages.

### 1. Install ArduPilot on DragonBoard 410C

ArduPilot is a popular open-source autopilot software compatible with various flight controllers, including PixHawk.

Open the terminal on your DragonBoard 410C and run the following commands to install ArduPilot:

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-matplotlib python-serial python-wxgtk3.0 python-wxtools python-lxml python-scipy python-opencv ccache gawk git python-pip python-pexpect
```

Clone the ArduPilot repository:

```bash
git clone https://github.com/ArduPilot/ardupilot.git
cd ardupilot
git submodule update --init --recursive
```

Choose the vehicle directory and run the build:

```bash
cd ArduCopter
make px4-v2
```

For a more detailed guide on installing ArduPilot, refer to the official [ArduPilot documentation](https://ardupilot.org/dev/docs/building-setup-linux.html#building-setup-linux).

### 2. Install MAVProxy

MAVProxy is a lightweight, command-line ground station software for high-level UAV control. Install it with the following command:

```bash
pip install MAVProxy
```

### 3. Connect the DragonBoard 410C to PixHawk

Use a USB to micro-USB cable or TTL converter to connect the DragonBoard to the PixHawk. The PixHawk should be powered through the power module, with communication taking place through the Telem2 port.

Identify the port on your DragonBoard:

```bash
ls /dev/serial/by-id
```

### 4. Run MAVProxy

Start MAVProxy with the correct options:

```bash
mavproxy.py --master=/dev/serial/by-id/usb-3D_Robotics_PX4_FMU_v2.x_0-if00 --baudrate 57600 --aircraft MyCopter
```

Replace "MyCopter" with your drone's name. The "--master" option is the communication port, and the "--baudrate" option is the communication speed.

MAVProxy should connect to ArduPilot on the PixHawk and start displaying status messages. For more about MAVProxy, refer to the [MAVProxy documentation](https://ardupilot.org/mavproxy/index.html).

### 5. Test Flight

Before a real flight, test your setup with a simulated flight using a flight simulator or a software-in-the-loop (SITL) simulator.

Here's a simple MAVProxy script for a test flight:

```bash
# Start script
arm throttle
takeoff 3
# Let the drone hover for 10 seconds
sleep 10
land
```

The `arm throttle` command prepares the drone for takeoff, the `takeoff 3` command makes the drone ascend to a height of 

3 meters, and the `land` command makes the drone land.

For more on testing, check out the [SITL guide](https://ardupilot.org/dev/docs/sitl-simulator-software-in-the-loop.html).

## Sensor Development

This project also provides instructions for developing an iOS application that controls the camera and 3-D sensor (LiDAR Scanner) on an iPhone 12 or later.

## [iOS App Guide](https://github.com/jpocon/OSCARs_Drone/Sensor/iOS_app.md/)

