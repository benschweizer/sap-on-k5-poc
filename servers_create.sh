#!/bin/bash
#

source project.txt
source token.txt


VM_NAME=fk5nwcs1vd
IMAGE_REF_ID="6e1610db-1115-4260-8dc2-bcdd526a54be"
FLAVER_ID=1103
VOL_SIZE=80
DEVICE_NAME=/dev/vda
SOURCE=image
DESTINATION=volume
ISDELETE=1
KEYNAME=awagner
INSTANCE_MAX=1
INSTANCE_MIN=1
NETWORK_ID="9e931434-be6c-408f-a237-c0548f9857e0"
SG_NAME=saponk5_sg01

curl -s "https://compute.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/servers" -X POST -H "X-Auth-Token: $OS_AUTH_TOKEN" -H  "Content-Type: application/json" -d '{"server": {"name":  "'$VM_NAME'",   "imageRef": "",   "flavorRef": "'$FLAVER_ID'",   "block_device_mapping_v2":[  {"boot_index": "0",   "uuid":"'$IMAGE_REF_ID'", "volume_size":  "'$VOL_SIZE'", "device_name":  "'$DEVICE_NAME'",  "source_type": "'$SOURCE'",  "destination_type":  "'$DESTINATION'",  "delete_on_termination": '$ISDELETE'} ] ,"key_name":  "'$KEYNAME'", "max_count": '$INSTANCE_MAX',  "min_count": '$INSTANCE_MIN',  "networks": [{"uuid":   "'$NETWORK_ID'"}],   "security_groups":   [{"name": "'$SG_NAME'"}]}}' | tail -1 | jq .
