#!/bin/bash
#

source project.txt
source token.txt

NW_NAME=mynetwork
curl -s https://networking.uk-1.cloud.global.fujitsu.com/v2.0/networks -X POST -H "X-Auth-Token:  $OS_AUTH_TOKEN"  -H  "Content-Type: application/json" -d '{"network":{  "name": "'$NW_NAME'", "availability_zone":  "'$AZ'"}}' | jq .

