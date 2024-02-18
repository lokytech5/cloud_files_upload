# Cloud_files_upload for Azure Blob Storage

## Overview
cloud_files_upload.bash is a Bash script that simplifies uploading files to Azure Blob Storage. It provides a command-line interface for quick and easy file transfers to Azure cloud storage.

## Prerequisites
- **Azure CLI**: Ensure Azure CLI is installed and configured on your system.
- **Bash**: This script is a Bash script, so a Unix-like environment is feature.

## Installation
1. Download or clone the cloud_files_upload repository.
2. Make the script executable: `chmod +x cloud_files_upload.bash`
3. (Optional) Add the script to your PATH for easy execution from any directory.

### Adding to PATH
If you want to run cloud_files_upload from any directory, add the installation directory to your PATH:

1. Open your shell profile file (like `~/.bashrc`, `~/.zshrc`, etc.).
2. Add the following line: `export PATH="$PATH:$HOME/.local/bin"`
3. Save the file and restart your terminal or run `source ~/.bashrc`.


## Usage
Basic command structure:

./cloud_files_upload.bash <path-to-file>

## Sample 
./cloud_files_upload.bash file1.txt

### Uploading a Single File
- ./cloud_files_upload.bash /path/to/your/file.txt

### Uploading Multiple Files (Advanced Feature)
- ./cloud_files_upload.bash /path/to/first/file.txt /path/to/second/file.txt

## Troubleshooting
- **Azure CLI Not Found**: Ensure Azure CLI is installed and in your system's PATH.
- **Authentication Issues**: Run `az login` to authenticate your Azure CLI session.
- **File Not Found**: Check the file path and ensure the file exists.
- **Permission Denied**: Run the script with appropriate permissions, or use `sudo` if necessary.

## Common Issues
- **Slow Upload Speed**: This can depend on your network connection and Azure's current performance.
