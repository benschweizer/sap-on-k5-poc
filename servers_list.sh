#!/bin/bash
#

source project.txt
source token.txt

curl -s "https://compute.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/servers" -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .
