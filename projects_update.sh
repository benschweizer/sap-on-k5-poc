#!/bin/bash
#

source project.txt
source token.txt
#DOMAIN_ID=5434b01e66de4d2997bc55374e9f04c5
PROJECT_ID=$1
DESCRIPTION="test"
ENABLED=true

curl -s "https://identity.uk-1.cloud.global.fujitsu.com/v3/projects/$PROJECT_ID" -X PATCH -H "X-Auth-Token: $OS_AUTH_TOKEN" -H  "Content-Type: application/json" -d '{"project": {"description": "'$DESCRIPTION'", "enabled": '$ENABLED'}}' | tail -1 | jq .
