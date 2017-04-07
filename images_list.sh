#!/bin/bash
#

source project.txt
source token.txt

# list images
curl -g -s -X GET https://image.uk-1.cloud.global.fujitsu.com/v2/images -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .
