#!/bin/bash

# Read the JSON array from the file
json=$(cat $1)

# Use jq to filter the JSON objects based on the type property and extract the fqdn property
fqdns=$(echo $json | jq '.[] | select(.type == "Microsoft.Network/dnszones/A" or .type == "Microsoft.Network/dnszones/CNAME") | 
.fqdn')

# Print the resulting fqdns
echo "$fqdns" | sed 's/\.com\./\.com/g' | sed 's/"//g'
