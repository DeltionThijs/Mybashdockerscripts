#!/bin/bash

# Define the base directory and other paths
BASE_DIR="/run/media/thijs/HDD/Oudsshdthijs/QEMU-IOS"
REPO_DIR="$BASE_DIR/xnu-qemu-arm64"
CONF_FILE="$REPO_DIR/docs/conf.py"
TARGET_BINARY="aarch64-softmmu/qemu-system-aarch64"
DEST_DIR="$BASE_DIR/compiled-binaries"

# Function to unmount and remove the directory
clean_directory() {
    local dir=$1
    if mountpoint -q "$dir"; then
        echo "Unmounting $dir"
        sudo umount "$dir"
    fi
    if [ -d "$dir" ]; then
        echo "Removing $dir"
        sudo rm -rf "$dir"
    fi
}

# Remove any existing directory
clean_directory "$REPO_DIR"

# Clone the repository
git clone https://github.com/alephsecurity/xnu-qemu-arm64.git "$REPO_DIR"

# Check if clone succeeded
if [ $? -ne 0 ]; then
    echo "Git clone failed"
    exit 1
fi

# Change to the directory
cd "$REPO_DIR" || { echo "Failed to change directory to $REPO_DIR"; exit 1; }

# Modify conf.py to set language to 'en'
if [ -f "$CONF_FILE" ]; then
    if grep -q "^language = 'en'$" "$CONF_FILE"; then
        echo "Language is already set to 'en' in $CONF_FILE"
    else
        echo "Setting language to 'en' in $CONF_FILE"
        echo "language = 'en'" >> "$CONF_FILE"
    fi
else
    echo "conf.py not found"
    exit 1
fi

# Ensure configure script exists and is executable
if [ ! -f "./configure" ]; then
    echo "Configure script not found"
    exit 1
fi

# Run the configure script
sudo ./configure --target-list=aarch64-softmmu --disable-capstone --disable-pie --disable-slirp --disable-werror

# Check if configure succeeded
if [ $? -ne 0 ]; then
    echo "Configure failed"
    exit 1
fi

# Run make with parallel jobs
sudo make -j16

# Check if make succeeded
if [ $? -ne 0 ]; then
    echo "Make failed"
    exit 1
fi

# Move the compiled binary to a lower directory
if [ -f "$REPO_DIR/$TARGET_BINARY" ]; then
    mkdir -p "$DEST_DIR"
    mv "$REPO_DIR/$TARGET_BINARY" "$DEST_DIR"
    if [ $? -ne 0 ]; then
        echo "Failed to move the binary"
        exit 1
    fi
    echo "Binary moved to $DEST_DIR"
else
    echo "Compiled binary not found"
    exit 1
fi

# Clean up
make distclean && rm -rf *-linux-user *-softmmu
