#!/bin/bash
#

source project.txt
source token.txt
USER_PW_BASE64=$(echo -n "$USER_PW" | base64)

UUID=2bd11551-8fdc-4d7e-9fc7-e5dc83704de0
UUID=$(uuidgen)

JSON=`cat <<HERE
{
  "name": "ocsacoXXX2vp_SMALL-ACO_Template_Windows-2008-R2-disk1",
  "disk_format": "raw",
  "container_format": "bare",
  "location": "/v1/AUTH_${PROJECT_ID}/agilwin/ocsacoXXX2vp_SMALL-ACO_Template_Windows-2008-R2-disk1.vmdk",
  "id": "${UUID}",
  "min_ram": "0",
  "min_disk": "0",
  "ovf_location": "",
  "conversion": true,
  "os_type": "win2008R2SE",
  "user_name": "$USER_NAME",
  "password": "$USER_PW_BASE64",
  "domain_name": "$DOMAIN_NAME"
}
HERE
`
JSON=`echo $JSON | jq -c .`

curl -sSi "https://vmimport.uk-1.cloud.global.fujitsu.com/v1/imageimport" -H "Content-Type: application/json" -H "Accept:application/json"  -H "X-Auth-Token: $OS_AUTH_TOKEN" -X POST -d "$JSON"
