#!/bin/bash


echo "Starting CloudUploader CLI..."


if ! command -v az &> /dev/null; then
    echo "Azure CLI not installed. Please install Azure CLI to proceed."
    exit 1
fi


echo "Authenticating with Azure..."
az login


if ! az account show > /dev/null 2>&1; then
    echo "Authentication failed. Please ensure your Azure credentials are correct."
    exit 1
fi

echo "Authenticated successfully."


if [ $# -eq 0 ]; then
    echo "No arguments provided. Please specify the file path to upload."
    exit 1
fi

FILE_TO_UPLOAD=$1
echo "File to upload: $FILE_TO_UPLOAD"


TARGET_DIRECTORY=$2
if [ -n "$TARGET_DIRECTORY" ]; then
    echo "Target cloud directory specified: $TARGET_DIRECTORY"
fi

# File Check
if [ ! -f "$FILE_TO_UPLOAD" ]; then
    echo "Error: File $FILE_TO_UPLOAD does not exist."
    exit 1
else
    echo "File $FILE_TO_UPLOAD found."
fi

# Define Azure Storage Account and Container Name
STORAGE_ACCOUNT=fileupload1
CONTAINER_NAME=cloudfile

# Get the storage account key
STORAGE_KEY=$(az storage account keys list --account-name $STORAGE_ACCOUNT --query '[0].value' -o tsv)

if [ -z "$STORAGE_KEY" ]; then
    echo "Error: Unable to retrieve storage account key."
    exit 1
fi


# Upload the file
echo "Uploading $FILE_TO_UPLOAD to $CONTAINER_NAME in Azure Blob Storage..."
az storage blob upload --account-name $STORAGE_ACCOUNT --account-key $STORAGE_KEY --container-name $CONTAINER_NAME --file "$FILE_TO_UPLOAD" --name "$(basename "$FILE_TO_UPLOAD")"

if [ $? -eq 0 ]; then
    echo "File uploaded successfully."
else
    echo "Error in file upload."
    exit 1
fi


#After file upload
blob_url=$(az storage blob url --account-name $STORAGE_ACCOUNT --container-name $CONTAINER_NAME --name "$(basename "$file")" --output tsv)
sas_token=$(az storage blob generate-sas --account-name $STORAGE_ACCOUNT --container-name $CONTAINER_NAME --name "$(basename "$file")" --permissions r --expiry [date] --output tsv)
echo "Shareable link: $blob_url?$sas_token"


