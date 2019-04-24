#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
KEY_ID=$1

GPG_EXPORT=$(sh "$SCRIPTPATH/../export-key.sh" $KEY_ID)

echo "Please enter your username for github.com: "
read GITHUB_USER

GPG_JSON="{\"armored_public_key\":\"$GPG_EXPORT\"}"

GITHUB_BASE_URL="https://api.github.com"
curl -u "$GITHUB_USER" -X POST "$GITHUB_BASE_URL/user/gpg_keys" -H "Accept: application/vnd.github.v3+json;Content-Type: application/json" -d "$GPG_JSON"