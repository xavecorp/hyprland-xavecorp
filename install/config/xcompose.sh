#!/bin/bash

# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/xavecorp/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$XAVECORP_USER_NAME"
<Multi_key> <space> <e> : "$XAVECORP_USER_EMAIL"
EOF
