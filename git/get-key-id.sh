#!/bin/bash
NAME=$1
COMMENT=$2
EMAIL=$3

KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | grep -B 2 "$NAME ($COMMENT) <$EMAIL>" | grep sec | cut -d'/' -f 2 | cut -d' ' -f 1)
echo $KEY_ID