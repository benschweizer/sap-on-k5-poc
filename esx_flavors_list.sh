#!/bin/bash
#

source project.txt
source token.txt

curl -s "https://compute-w.uk-1.cloud.global.fujitsu.com/templates/l_servers?verbose=true" -H "X-Auth-Token: $OS_AUTH_TOKEN" | xmllint --format -
