#!/bin/bash
#

source project.txt
source token.txt

IMPORT_ID="8b6c341b-b4ea-479d-937e-f6cb0f3cb989"
IMPORT_ID=$1

curl -s "https://vmimport.uk-1.cloud.global.fujitsu.com/v1/imageimport/${IMPORT_ID}/status" -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .
