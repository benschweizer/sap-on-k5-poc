#!/bin/bash
#

source project.txt
source token.txt

SERVER_ID="ror-svror2_13769"
SERVER_ID=$1

curl -s https://compute-w.uk-1.cloud.global.fujitsu.com/l_servers/$SERVER_ID -X DELETE -H  "X-Auth-Token: $OS_AUTH_TOKEN"

