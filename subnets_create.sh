#!/bin/bash
#

source project.txt
source token.txt

SUBNET=mylittlesubnet
SUBNET=fcx_subnet-w:subnet_101              # hidden naming scheme, critical for esx attachment!!!
NETWORK_ID="9e931434-be6c-408f-a237-c0548f9857e0"
CIDR="10.56.129.0/24"
GATEWAY_IP="10.56.129.1"
DNS1=133.162.131.9
DNS2=133.162.131.10
ALLOC_START="10.56.129.10"
ALLOC_END="10.56.129.20"
curl -s https://networking.uk-1.cloud.global.fujitsu.com/v2.0/subnets -X POST -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type:  application/json" -d '{"subnet":  {"name": "'$SUBNET'",   "network_id": "'$NETWORK_ID'",  "cidr":  "'$CIDR'",  "allocation_pools":[{"start": "'$ALLOC_START'",  "end": "'$ALLOC_END'"}], "dns_nameservers":  ["'$DNS1'", "'$DNS2'"], "ip_version": 4,  "gateway_ip":   "'$GATEWAY_IP'", "availability_zone":  "'$AZ'" }}' | jq .

