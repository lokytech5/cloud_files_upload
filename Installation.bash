#!/bin/bash

# Define the location to download the script
DOWNLOAD_URL="https://example.com/cloud_files_upload.bash"
INSTALL_DIR="$HOME/.local/bin" # Or any directory in $PATH

echo "Downloading CloudUploader CLI..."
curl -o "$INSTALL_DIR/cloud_files_upload.bash" $DOWNLOAD_URL

echo "Making the script executable..."
chmod +x "$INSTALL_DIR/cloud_files_upload.bash"

echo "cloud_files_upload installed successfully."
echo "You can run the tool using 'cloud_files_upload.bash' command."
