#!/bin/bash
#

JSON=`cat <<HERE
{
  "auth": {
    "identity": {
      "methods": [
        "password"
      ],
      "password": {
        "user": {
          "domain": {
            "name": "XtcbGU3j"
          },
          "name": "schweizerb",
          "password": "fC6teWw9d3BfUjQh"
        }
      }
    },
    "scope": {
      "project": {
        "id": "34aff57110974e3c8ffb640c36742bda"
      }
    }
  }
}
HERE
`

# logon
curl -sSi https://identity.uk-1.cloud.global.fujitsu.com/v3/auth/tokens -H "Content-Type: application/json" -H "Accept:application/json" -X POST -d "$JSON" | tee logon.txt | grep -e '^X-Subject-Token: ' | sed -e 's/^X-Subject-Token: /OS_AUTH_TOKEN=/g' > token.txt    #awk '/X-Subject-Token/ {print $2}' | tr -d '\r\n' > token.txt
tail -1 logon.txt | jq . > inventory.txt
cat token.txt

# eof.
