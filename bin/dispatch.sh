#!/bin/bash
set -e

# Ensure we have at least an input file
if [ $# -eq 0 ]; then
    echo "Usage: provision.sh <input file>"
    exit 1
fi

# Loop over each line
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Input file: $line"
    nomad job dispatch -detach -meta "profile=large" -meta "input=$line" transcode
    nomad job dispatch -detach -meta "profile=large" -meta "input=$line" transcode
done < "$1"
