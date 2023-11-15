#!/bin/bash

# Define the file names
blacklist_file="blackList.txt"
ips_file="ips.txt"

# Create a temporary file to store the filtered content
temp_file=$(mktemp)

# Use grep to filter lines from ips.txt that are not in blackList.txt
grep -Fvxf "$blacklist_file" "$ips_file" > "$temp_file"

# Replace ips.txt with the filtered content
mv "$temp_file" "$ips_file"

echo "Lines from blackList.txt have been removed from ips.txt."
