#!/bin/bash
#

source project.txt
source token.txt
SNAP_NAME="testblocksnapshot"
VOLUME_ID="866cc1bb-e1cf-4112-ba47-cefcf7a94fa2"
VOLUME_ID=$1
FORCE=true
#DESCRIPTION=
curl -s "https://blockstorage.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/snapshots" -X POST -H "X-Auth-Token: $OS_AUTH_TOKEN"  -H "Content-Type: application/json" -d '{"snapshot": {"name": "'$SNAP_NAME'", "volume_id": "'$VOLUME_ID'", "force": "'$FORCE'" }}'
