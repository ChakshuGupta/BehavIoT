#! /bin/bash

DIR_NAME=$1
FILE_NAME=$2

# Check if there was an argument in the command
if [ $# -eq 0 ]
  then
    echo "Need argument: Path to the dataset directory!"
    exit
fi

find "$DIR_NAME" -type f -not -path '*/.*' | while IFS= read -r file; do
  extension="${file##*.}"
  if [ "$extension" == "pcap" ]; then
    echo "$PWD/""$file" >> "$FILE_NAME"
  fi
done