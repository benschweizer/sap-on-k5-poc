#!/bin/bash
#

source project.txt
source token.txt

curl -s https://compute-w.uk-1.cloud.global.fujitsu.com/l_servers -H "X-Auth-Token: $OS_AUTH_TOKEN" | xmllint --format -
