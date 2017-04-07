#!/bin/bash
#

source project.txt
source token.txt

SUBNET_ID="f7f43ff1-2cd1-484d-9ec0-8f4b41feda10"

curl -s https://compute-w.uk-1.cloud.global.fujitsu.com/networks -X POST -H "Content-Type: application/xml" -H "Accept: application/xml" -H "X-Auth-Token: $OS_AUTH_TOKEN" -d '<Network><Subnet id="'$SUBNET_ID'"></Subnet><Availability_zone>'$AZ'</Availability_zone></Network>' | xmllint --format -
