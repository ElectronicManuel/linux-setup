#!/bin/bash
KEY_ID=$1

GPG_EXPORT=$(sh `dirname $0`/../export-key.sh $KEY_ID)

stty -echo
printf "Please provide your personal access token for gitlab.com: "
read GITLAB_TOKEN
stty echo
printf "\n"

GITLAB_BASE_URL="https://gitlab.com/api/v4"
curl --data-urlencode "key=$GPG_EXPORT"  -H "PRIVATE-TOKEN: $GITLAB_TOKEN" $GITLAB_BASE_URL/user/gpg_keys
echo $GPG_EXPORT
echo "If this didn't work you'll need to upload the key to gitlab directly: https://gitlab.com/profile/gpg_keys"