#!/bin/bash
KEY_ID=$1

GPG_EXPORT=$(gpg --armor --export $KEY_ID | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g')
echo $GPG_EXPORT