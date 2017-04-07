#!/bin/bash
#

source project.txt
source token.txt

curl -s https://compute-w.uk-1.cloud.global.fujitsu.com/projects -H "Content-Type: application/x-www-form-urlencoded" -H "Accept:  application/xml" -H "X-VA-Project-Id: $PROJECT_ID" -H "X-Auth-Token: $OS_AUTH_TOKEN" -X POST -d 'project_id='$PROJECT_ID'&availability_zone='$AZ''

# eof.
