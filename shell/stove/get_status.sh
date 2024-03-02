#!/bin/bash

# This script sends a POST request to the WINET Pellet Stove Module
# The module will return a JSON list with the status of the stove including the temperature and the power mode.
# This command writes the result in a response file which i use in a file sensor.
# Rememeber to change IPADDRESS with you IP Address of the WINET Module

rm /config/shell/stove/response_get_status.txt
echo "working" > /config/shell/stove/response_get_status.txt
sleep 5

curl 'http://IPADDRESS/ajax/get-registers' \
  --data-raw 'key=020&category=2' \
  --compressed \
  --insecure > /config/shell/stove/response_get_status.txt
