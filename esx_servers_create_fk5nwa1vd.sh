#!/bin/bash
#

source project.txt
source token.txt

NAME=fk5nwa1vd
FLAVOR_NAME=WS-4 # esx 
IMAGE_NAME="WindowsServer2012R2SE_64_en" # esx template name
DISK_INDEX=0
NIC_INDEX=0
SUBNET_ID="ror-svror2_13761" # esx network id
IS_AUTO_IP=false
IP_ADDR="10.56.129.2" # from subnet range
PW="0000"
NIC_NUM=0
DNS_IP="133.162.131.9" # like subnet dhcp servers
AZ="uk-1b"

curl -s https://compute-w.uk-1.cloud.global.fujitsu.com/l_servers -X POST -H "Content-Type: application/xml" -H  "Accept: application/xml" -H  "X-Auth-Token: $OS_AUTH_TOKEN"  -d '<Resources><LServer name="'$NAME'"><TemplateLink name="'$FLAVOR_NAME'"></TemplateLink><ServerImageLink name="'$IMAGE_NAME'"></ServerImageLink><Disks><Disk><DiskIndex>'$DISK_INDEX'</DiskIndex></Disk></Disks><NICs><NIC><NICIndex>'$NIC_INDEX'</NICIndex><NetworkLinks><NetworkLink id="'$SUBNET_ID'"><IpAddress auto="'$IS_AUTO_IP'" address="'$IP_ADDR'"></IpAddress></NetworkLink></NetworkLinks></NIC></NICs><OSSetting><AdminPassword>'$PW'</AdminPassword><DNSServers><DNSServer nic="'$NIC_NUM'" ip="'$DNS_IP'"></DNSServer></DNSServers></OSSetting><Availability_zone>'$AZ'</Availability_zone></LServer></Resources>' | xmllint --format -

