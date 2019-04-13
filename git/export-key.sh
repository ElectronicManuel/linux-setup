#!/bin/bash
KEY_ID=$1

gpg --armor --export $KEY_ID | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g'