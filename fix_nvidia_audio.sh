#!/bin/bash

# Thanks to all the users at the nvidia forums for their insight into
# solving an issue that should have been fixed over a decade ago.
# https://forums.developer.nvidia.com/t/gtx-1060-no-audio-over-hdmi-only-hda-intel-detected-azalia/53463/10

# This resolves the issue of NVIDIA GPUs not having a persistant audio output.
# i.e. the audio output will "go to sleep" and will take a few seconds to
# start playing again once audio is requested to be played again.

# Find the NVIDIA GPU's PCI address (VGA device)
GPU_PCI=$(lspci | awk '/controller.*NVIDIA/{print $1}')
echo "Detected NVIDIA GPU at PCI address: $GPU_PCI"

# Find the parent PCI bridge address
GPU_SYSFS_PATH=$(readlink -f /sys/bus/pci/devices/0000:${GPU_PCI})
PARENT_BRIDGE_PATH=$(dirname "$GPU_SYSFS_PATH")
PARENT_BRIDGE=$(basename "$PARENT_BRIDGE_PATH")
echo "Detected parent PCI bridge at address: $PARENT_BRIDGE"

# Confirm with the user if they want to continue
printf "\nWARNING! THIS MUST BE RUN IN A NON-GRAPHICAL ENVIRONMENT\n\n"
echo -n "Would you like to continue? (y/N) "
read -r CONTINUE
if [[ $CONTINUE =~ ^[Yy]$ ]]
then
    echo "Continuing..."
else
    echo "Exiting..."
    exit 1
fi

# Stop services that might be using the GPU
sudo systemctl stop systemd-logind
sudo systemctl stop lightdm

# Reset the GPU via PCI configuration space manipulation
sudo setpci -s "$GPU_PCI" 0x488.l=0x2000000:0x2000000

# Unload NVIDIA kernel modules
sudo rmmod nvidia-drm nvidia-modeset nvidia

# Remove the GPU device from the PCI bus
sudo sh -c "echo 1 > /sys/bus/pci/devices/0000:${GPU_PCI}/remove"
echo "Removed GPU device at 0000:${GPU_PCI}"

# Rescan the PCI bus to detect devices starting from the parent bridge
sudo sh -c "echo 1 > /sys/bus/pci/devices/${PARENT_BRIDGE}/rescan"
echo "Rescanned PCI bridge at ${PARENT_BRIDGE}"

# Reload NVIDIA kernel modules
sudo modprobe nvidia-drm
echo "Reloaded NVIDIA kernel modules"

# Start services back up
sudo systemctl start systemd-logind
sudo systemctl start lightdm

echo "GPU reset process completed successfully."