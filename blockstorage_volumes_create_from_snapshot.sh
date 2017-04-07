#!/bin/bash
source project.txt
source token.txt

function print_help {
    echo "$0:" >&2
    echo "  -a '<Name der Availability Zone>'                                           [REQUIRED]" >&2
    echo "  -d '<Description des neuen Volumes>'                                        [OPTIONAL]" >&2
    echo "  -i '<snapshot id aus der das neue Volume erstellt werden soll>'             [REQUIRED]" >&2
    echo "  -s '<Größe des neuen Volume (darf nicht kleiener als der Snapshot sein)>'   [REQUIRED]" >&2
    echo "  -n '<Name des neuen Volumes>'                                               [REQUIRED]" >&2
}

while getopts a:d:i:s:n: opt; do
    case $opt in
        a) AVAILABILITY_ZONE="$OPTARG";;
        d) DESCRIPTION="$OPTARG";;
        i) SNAPSHOT_ID="$OPTARG";;
        s) VOLUME_SIZE="$OPTARG";;
        n) VOLUME_NAME="$OPTARG";;
        \?|:|*)
            print_help
            exit 1;;
    esac
done

if [ -z "$AVAILABILITY_ZONE" ]  ||
   [ -z "$SNAPSHOT_ID" ]        ||
   [ -z "$VOLUME_SIZE" ]        ||
   [ -z "$VOLUME_NAME" ]; then
    echo "Bitt die benötigten Optionen angeben" >&2
    print_help
    exit 1
fi

curl -s "https://blockstorage.uk-1.cloud.global.fujitsu.com/v2/$PROJECT_ID/volumes" -X POST -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" \
    -d '{"volume": {
            "availability_zone": "'$AVAILABILITY_ZONE'",
            "description": "'$DESCRIPTION'",
            "snapshot_id": "'$SNAPSHOT_ID'",
            "size": "'$VOLUME_SIZE'",
            "NAME": "'$VOLUME_NAME'"
            }
        }'
