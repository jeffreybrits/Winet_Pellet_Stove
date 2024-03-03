#!/bin/bash

# This script sends a POST request to the WINET Pellet Stove Module
# The module will return a status to indicate if the call was succesfull or not
# This command writes the result in a response file which i use in a file sensor.
# Rememeber to change IPADDRESS with you IP Address of the WINET Module

rm /config/shell/stove/response_toggle_power_on.txt
echo "working" > /config/shell/stove/response_toggle_power_on.txt
sleep 5

curl -i -s -k -X $'POST' \
    --data-binary $'key=022' \
    $'http://IPADDRESS/ajax/get-registers' > /config/shell/stove/response_toggle_power_on.txt