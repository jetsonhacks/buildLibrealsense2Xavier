#!/bin/bash
# Install the Intel Realsense library kernel patches on a NVIDIA Jetson AGX Xavier Developer Kit
# Copyright (c) 2016-19 Jetsonhacks 
# MIT License

set -e

INSTALL_DIR=$PWD
module_dir=$PWD/modules
echo $module_dir

cd ${HOME}/librealsense
LIBREALSENSE_DIR=$PWD
kernel_branch="master"
echo "kernel branch" $kernel_branch
kernel_name="kernel-4.9"


# For L4T 31.1.0 the kernel is 4.9.108 hence kernel-4.9

# Patches are available for kernel 4.4, 4.10 and 4.16
# For L4T 31.1.0, the kernel is 4.9
# Therefor we have to do a little dance and choose our patches artisinally

cd /usr/src/kernel/kernel-4.9

# ubuntu_codename=`. /etc/os-release; echo ${UBUNTU_CODENAME/*, /}`
# ubuntu_codename is xenial for L4T 28.X (Ubuntu 16.04)
# ubuntu_codename is bionic for L4T 31.1 (Ubuntu 18.04)
# Patching kernel for RealSense devices
echo -e "\e[32mApplying realsense-uvc patch\e[0m"
# Try to catch it up to 4.10
patch -p1 < ${LIBREALSENSE_DIR}/scripts/realsense-camera-formats_ubuntu-xenial-master.patch 
echo -e "\e[32mApplying realsense-metadata patch\e[0m"
patch -p1 < ${LIBREALSENSE_DIR}/scripts/realsense-metadata-ubuntu-xenial-master.patch
echo -e "\e[32mApplying realsense-hid patch\e[0m"
patch -p1 < ${LIBREALSENSE_DIR}/scripts/realsense-hid-ubuntu-xenial-master.patch
echo -e "\e[32mpowerlinefrequency-control-fix patch\e[0m"
patch -p1 < ${LIBREALSENSE_DIR}/scripts/realsense-powerlinefrequency-control-fix.patch

#
# Driver Location:
# /lib/modules/4.9.108-tegra/kernel/drivers/media/

