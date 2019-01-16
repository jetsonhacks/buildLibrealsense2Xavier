#!/bin/bash
# Applies application patches for librealsense2 on a Jetson AGX Xavier Developer Kit
# Copyright (c) 2016-19 Jetsonhacks 
# MIT License

echo "${green}Applying Model-Views Patch${reset}"
# The render loop of the post processing does not yield; add a sleep
patch -p1 -i $INSTALL_DIR/patches/model-views.patch

echo "${green}Applying Incomplete Frames Patch${reset}"
# The Jetson tends to return incomplete frames at high frame rates; suppress error logging
patch -p1 -i $INSTALL_DIR/patches/incomplete-frame.patch


