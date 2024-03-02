#!/bin/bash

# This script sends a POST request to the specified host with custom headers and data.

rm /config/shell/stove/response_power1.txt
echo "working" > /config/shell/stove/response_power1.txt
sleep 5

curl -i -s -k -X $'POST' \
    --data-binary $'key=002&memory=1&regId=51&value=1' \
    $'http://IPADDRESS/ajax/set-register' > /config/shell/stove/response_power1.txt
