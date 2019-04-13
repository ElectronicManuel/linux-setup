#!/bin/bash
NAME=$1
COMMENT=$2
EMAIL=$3

stty -echo
printf "Please enter a passphrase for the gpg key: "
read PASSPHRASE
stty echo
printf "\n"

KEY_FILE="$(mktemp)"
cat >$KEY_FILE <<EOF
     Key-Type: RSA
     Key-Length: 4096
     Subkey-Type: RSA
     Subkey-Length: 4096
     Name-Real: $NAME
     Name-Comment: $COMMENT
     Name-Email: $EMAIL
     Expire-Date: 0
     Passphrase: $PASSPHRASE
     %commit
EOF
gpg --batch --generate-key $KEY_FILE