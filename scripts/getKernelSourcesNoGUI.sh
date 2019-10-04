#!/bin/bash
apt-add-repository universe
apt-get update
apt-get install pkg-config -y
cd /usr/src
wget -N -O l4t-src.tbz2 https://developer.nvidia.com/embedded/dlc/r32-2-1_Release_v1.0/TX2-AGX/sources/public_sources.tbz2
# l4t-sources-32-1-0 is a tbz2 file
tar -xvf l4t-src.tbz2
tar -xvf public_sources/kernel_src.tbz2
# Space is tight; get rid of the compressed kernel source
rm -r public_sources
cd kernel/kernel-4.9
# Go get the default config file; this becomes the new system configuration
zcat /proc/config.gz > .config

