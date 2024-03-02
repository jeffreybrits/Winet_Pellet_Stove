#!/bin/bash

# This script sends a POST request to the specified host with custom headers and data.

rm /config/shell/stove/response_toggle_power_off.txt
echo "working" > /config/shell/stove/response_toggle_power_off.txt
sleep 5

curl -i -s -k -X $'POST' \
    --data-binary $'key=022' \
    $'http://192.168.1.110/ajax/get-registers' > /config/shell/stove/response_toggle_power_off.txt
