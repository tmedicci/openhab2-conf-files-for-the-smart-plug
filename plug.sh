#!/bin/bash

set -e

MAC="$1"
if [ -z "$MAC" ]; then
    echo "Incorrect usage: \$1 must contain last 3 bytes of Smart Plug MAC Address"
    exit 1
fi

REFRESHED_STATE="null"

if [ "$2" = "ON" ]; then
    #TODO: test if curl exits before piping to jq.
    REFRESHED_STATE=$(curl -s "http://smartplug${MAC}.local:8080/API/relay" --header "Content-Type: application/json" --data "{\"timestamp\": $(date +%s),\"relay_state\":true}" | jq -r ".relay")
else
    if [ "$2" = "OFF" ]; then
        REFRESHED_STATE=$(curl -s "http://smartplug${MAC}.local:8080/API/relay" --header "Content-Type: application/json" --data "{\"timestamp\": $(date +%s),\"relay_state\":false}" | jq -r ".relay")
    else 
        CURRENT_STATE=$(curl -s "http://smartplug${MAC}.local:8080/API/configData" | jq -r ".relay_state")
        if [ "$CURRENT_STATE" != "false" ] && [ "$CURRENT_STATE" != "true" ]; then
            exit 1
        else
            echo "$CURRENT_STATE"
            exit 0
        fi
    fi
fi

if [ "$REFRESHED_STATE" != "false" ] && [ "$REFRESHED_STATE" != "true" ]; then
    exit 1
fi

echo "$REFRESHED_STATE"
exit 0
