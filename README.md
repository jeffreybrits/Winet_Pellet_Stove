# Winet_Pellet_Stove
WINET Home Assistant

An attemt to document the steps i've taken to let home assistant talk with my Winet module for my pellet Stove.

**General approach:**
1) Visit web page of you Winet module entering the local IP address of you Winet module. (E.g. 192.168.1.99)
   I used google Chrome
   ![image](https://github.com/jeffreybrits/Winet_Pellet_Stove/assets/55175145/782621da-16e3-46da-b05d-37f46ce5011e)
2) Open the development tools of your browser. and navigate to the network tab
   ![image](https://github.com/jeffreybrits/Winet_Pellet_Stove/assets/55175145/e79c047b-b7ef-46d7-94a0-497b7332b220)
3) When looking at the network tab you'll see that there is a constant stream of "get-registers" calls
   Whenever you click the buttons to either change the temperature or the the power you'll see a "set-register" call.
   We can use these calls to turn them into shell command which we can send from Home assitant.
   ![image](https://github.com/jeffreybrits/Winet_Pellet_Stove/assets/55175145/c32af48c-590f-4348-bafd-a74a3cacd421)
4) To get the exact command used to change the status you can right click the "Get-registers" or "set-register" call and click Copy --> Copy as cURL Command Bash
![image](https://github.com/jeffreybrits/Winet_Pellet_Stove/assets/55175145/6182acc2-2382-4e64-b664-f0e1c0e041e9)
In my case the call was the following

_curl 'http://IPADDRESS/ajax/get-registers' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'Accept-Language: nl,en-US;q=0.9,en;q=0.8,fr;q=0.7,de-DE;q=0.6,de;q=0.5' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Cookie: winet_lang=en' \
  -H 'Origin: http://IPADDRESS' \
  -H 'Referer: http://IPADDRESS/management.html' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw 'key=020&category=2' \
  --insecure__
  
5) Remove all the data which tags in the wall which are not strictly required.
   
_curl 'http://IPADDRESS/ajax/get-registers' \
  --data-raw 'key=020&category=2' \
  --insecure__
   

