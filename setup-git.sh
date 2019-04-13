#!/bin/bash

# Configure Git credential store
sudo apt install libsecret-1-0 libsecret-1-dev
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make

# Set TTL for gpg agent
echo "default-cache-ttl 604800" >> ~/.gnupg/gpg-agent.conf