#!/bin/bash
#

source project.txt
source token.txt

NETWORK_ID=c98ae87b-7a98-40a8-a00d-e4517ed632fc
NETWORK_ID=$1

curl -s https://networking.uk-1.cloud.global.fujitsu.com/v2.0/networks/$NETWORK_ID -X DELETE -H "X-Auth-Token: $OS_AUTH_TOKEN"


