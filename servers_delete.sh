#!/bin/bash
#

source project.txt
source token.txt

SERVER_ID="3c94c8cb-3765-4d46-84fc-5500b2352541"
SERVER_ID=$1

curl -s "https://compute.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/servers/$SERVER_ID" -X DELETE -H "X-Auth-Token: $OS_AUTH_TOKEN"
