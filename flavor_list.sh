#!/bin/bash
#

source project.txt
source token.txt

curl -s -X GET https://compute.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/flavors/detail -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .

