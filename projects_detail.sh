#!/bin/bash
#

source project.txt
source token.txt
#DOMAIN_ID=5434b01e66de4d2997bc55374e9f04c5
PROJECT_ID=34aff57110974e3c8ffb640c36742bda
PROJECT_ID=$1
curl -s "https://identity.uk-1.cloud.global.fujitsu.com/v3/projects/$PROJECT_ID" -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .


