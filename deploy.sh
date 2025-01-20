#!/bin/bash

# Read environment variables
BRANDING_IMAGE=${BRANDING_IMAGE:-default-image.png}
BRANDING_NAME=${BRANDING_NAME:-llamacoder}
BRANDING_COLOR=${BRANDING_COLOR:-#000000}
BRANDING_FONT=${BRANDING_FONT:-Arial}

# Update branding-config.json
jq ".branding.image = \"$BRANDING_IMAGE\" | .branding.name = \"$BRANDING_NAME\" | .branding.style.color = \"$BRANDING_COLOR\" | .branding.style.font = \"$BRANDING_FONT\"" branding-config.json > branding-config.tmp && mv branding-config.tmp branding-config.json

echo "Branding configuration updated successfully."
