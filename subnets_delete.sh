#!/bin/bash
#

source project.txt
source token.txt

SUBNET_ID="ef44eb8a-356b-4f07-9d1a-74d29fd14aae"
SUBNET_ID=$1

curl -s -X DELETE https://networking.uk-1.cloud.global.fujitsu.com/v2.0/subnets/$SUBNET_ID -H "X-Auth-Token: $OS_AUTH_TOKEN" | jq .
#curl -s -X DELETE https://compute-w.uk-1.cloud.global.fujitsu.com/v2.0/subnets/$ID -H "X-Auth-Token: $OS_AUTH_TOKEN"
