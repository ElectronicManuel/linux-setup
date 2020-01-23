#!/bin/bash

JABBA_URL="https://github.com/shyiko/jabba/raw/master/install.sh"
JDK_URL="tgz+https://javadl.oracle.com/webapps/download/AutoDL?BundleId=240718_5b13a193868b4bf28bcb45c792fce896"
JABBA_PROFILE_NAME="1.8.231-custom"

# Install jabba
curl -sL $JABBA_URL | bash && . ~/.jabba/jabba.sh

# Install JDK 8 from oracle (best gaming performance)
jabba install $JABBA_PROFILE_NAME=$JDK_URL
jabba use $JABBA_PROFILE_NAME
jabba alias default $JABBA_PROFILE_NAME
