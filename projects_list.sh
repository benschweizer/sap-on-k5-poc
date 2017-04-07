#!/bin/bash
#

source project.txt
source token.txt
DOMAIN_ID=5434b01e66de4d2997bc55374e9f04c5
#curl -s "https://compute.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/servers" -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .
curl -s "https://identity.uk-1.cloud.global.fujitsu.com/v3/projects?domain_id=$DOMAIN_ID" -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" | tail -1 | jq .
