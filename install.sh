#!/bin/bash

# Get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Copy the script to /usr/local/bin
sudo cp "$DIR/cpp-init" /usr/local/bin

# Add /usr/local/bin to the system path
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

# Source the shell
source ~/.bash_profile

echo "Script installed successfully!"
