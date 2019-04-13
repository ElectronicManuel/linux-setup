#!/bin/bash
GPG_EXPORT=$1

stty -echo
printf "Please provide your personal access token for gitlab.com: "
read GITLAB_TOKEN
stty echo
printf "\n"

GITLAB_BASE_URL="https://gitlab.com/api/v4"
curl --data "key=$GPG_EXPORT"  -H "PRIVATE-TOKEN: $GITLAB_TOKEN" $GITLAB_BASE_URL/user/gpg_keys