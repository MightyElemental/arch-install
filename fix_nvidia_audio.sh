#!/bin/bash

# Thanks to all the users at the nvidia forums for their insight into
# solving an issue that should have been fixed over a decade ago.
# https://forums.developer.nvidia.com/t/gtx-1060-no-audio-over-hdmi-only-hda-intel-detected-azalia/53463/10
# Also thanks to: https://www.reddit.com/r/VFIO/comments/15b0z78/comment/kofs4t3/

# This resolves the issue of the system not seeing an audio output for NVIDIA GPUs

function fail() {
    echo "Process failed. Please check the above log."
    exit 1
}

function nvidiainuse() {
    echo "Nvidia modules are still in use!"
    echo "Ensure all processes and services are terminated."
    fail
}

function stop_ollama() {
    # This is highly specific to my usecase
    if systemctl is-active --quiet ollama; then
        echo "ollama was running. Stopping..."
        sudo systemctl stop ollama
        sleep 2
    fi
}

# Find the NVIDIA GPU's PCI address (VGA device)
GPU_PCI=$(lspci | awk '/controller.*NVIDIA/{print $1}')
echo "Detected NVIDIA GPU at PCI address: $GPU_PCI"

# Find the parent PCI bridge address
GPU_SYSFS_PATH=$(readlink -f /sys/bus/pci/devices/0000:${GPU_PCI})
PARENT_BRIDGE_PATH=$(dirname "$GPU_SYSFS_PATH")
PARENT_BRIDGE=$(basename "$PARENT_BRIDGE_PATH")
echo "Detected parent PCI bridge at address: $PARENT_BRIDGE"

echo ""
echo "Sanity check>>"
echo "PCI address points to: " `lspci | grep $GPU_PCI`

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

# Stop ollama if present
stop_ollama

# Stop services that might be using the GPU
echo "Stopping systemd-logind..."
sudo systemctl stop systemd-logind
echo "Stopping lightdm..."
sudo systemctl stop lightdm

sleep 1

# Check if nvidia is in use by anything else
sudo fuser -v /dev/nvidia* && nvidiainuse

# Reset the GPU via PCI configuration space manipulation
echo "Reset GPU via PCI config space..."
sudo setpci -s "$GPU_PCI" 0x488.l=0x2000000:0x2000000

# Unload NVIDIA kernel modules
echo "Unloading NVIDIA kernel modules..."
sudo modprobe -r nvidia-uvm nvidia-drm nvidia-modeset nvidia || fail

# Remove the GPU device from the PCI bus
echo "Removing GPU device from PCI bus..."
sudo sh -c "echo 1 > /sys/bus/pci/devices/0000:${GPU_PCI}/remove"
echo "Removed GPU device at 0000:${GPU_PCI}"

# Rescan the PCI bus to detect devices starting from the parent bridge
echo "Rescanning PCI bridge at ${PARENT_BRIDGE}..."
sudo sh -c "echo 1 > /sys/bus/pci/devices/${PARENT_BRIDGE}/rescan"

# Reload NVIDIA kernel modules
echo "Reloading NVIDIA kernel modules..."
sudo modprobe nvidia-drm
echo "Reloaded NVIDIA kernel modules"

echo "GPU reset process completed."

echo -n "Would you like to restart? (y/N) "
read -r CONTINUE
if [[ $CONTINUE =~ ^[Yy]$ ]]
then
    echo "Restarting..."
    sudo shutdown -r now
else
    echo "Starting systemd-logind..."
    sudo systemctl start systemd-logind
    echo "Starting lightdm..."
    sudo systemctl start lightdm
    echo "Done."
fi
