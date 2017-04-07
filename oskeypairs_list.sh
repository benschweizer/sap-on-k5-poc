#!/bin/bash
#

source project.txt
source token.txt

curl -s -X GET https://compute.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/os-keypairs -H "Accept: application/json" -H "X-Auth-Token: $OS_AUTH_TOKEN" | jq .

