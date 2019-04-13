#!/bin/bash
GPG_EXPORT=$1

echo "Please enter your username for github.com: "
read GITHUB_USER

GITHUB_BASE_URL="https://api.github.com"
curl -u "$GITHUB_USER" -X POST "$GITHUB_BASE_URL/user/gpg_keys" -H "Accept: application/vnd.github.v3+json;Content-Type: application/json" -d "{\"armored_public_key\":\"$GPG_EXPORT\"}"