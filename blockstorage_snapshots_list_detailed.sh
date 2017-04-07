#!/bin/bash
#

source project.txt
source token.txt

curl -s "https://blockstorage.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/snapshots/detail" -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .
