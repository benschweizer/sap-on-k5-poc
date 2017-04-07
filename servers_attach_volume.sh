#!/bin/bash
source project.txt
source token.txt

function print_help {
    echo "$0:" >&2
    echo "  -s '<Server ID>'                   [REQUIRED]" >&2
    echo "  -v '<Volume ID>'                   [REQUIRED]" >&2
    echo "  -d '<Device name (z.B.: /dev/vdb)> [OPTIONAL]" >&2
}

while getopts s:v:d: opt; do
    case $opt in
        s) SERVER_ID="$OPTARG";;
        v) VOLUME_ID="$OPTARG";;
        d) DEVICE_NAME="$OPTARG";;
        \?|:|*)
            print_help
            exit 1;;
    esac
done

if [ -z "$VOLUME_ID" ] ||
   [ -z "$SERVER_ID" ]; then
    echo "Bitt die benötigten Optionen angeben" >&2
    print_help
    exit 1
fi

curl -s "https://compute.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/servers/$SERVER_ID/os-volume_attachments" -X POST -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" \
    -d '{"volumeAttachment": {
            "volumeId": "'$VOLUME_ID'",
            "device": "'$DEVICE_NAME'"
            }
        }'
