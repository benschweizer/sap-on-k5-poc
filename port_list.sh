#!/bin/bash
#

source project.txt
source token.txt

curl -s -X GET https://networking.uk-1.cloud.global.fujitsu.com/v2.0/ports.json -H "Accept: application/json" -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .

