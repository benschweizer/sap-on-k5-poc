#!/bin/bash
#

source project.txt
source token.txt

curl -s "https://vmimport.uk-1.cloud.global.fujitsu.com/v1/imageimport" -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .
