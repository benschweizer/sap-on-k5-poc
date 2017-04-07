#!/bin/bash
#

source project.txt
source token.txt

NETWORK_ID="ror-svror2_13749"
NETWORK_ID=$1

curl -s https://compute-w.uk-1.cloud.global.fujitsu.com/networks/$NETWORK_ID -X DELETE -H "X-Auth-Token: $OS_AUTH_TOKEN"


