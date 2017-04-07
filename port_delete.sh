#!/bin/bash
#

source project.txt
source token.txt

PORT_ID=e0cec03f-2ac9-40a7-bf61-f24b932b347c
PORT_ID=$1

curl -s -X DELETE https://networking.uk-1.cloud.global.fujitsu.com/v2.0/ports/${PORT_ID}.json -H "Accept: application/json" -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .

