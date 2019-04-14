#!/bin/bash
NAME=$1
COMMENT=$2
EMAIL=$3
GIT_SITE=$4
GIT_PROFILE_NAME=$5

echo Name: $NAME
echo Comment: $COMMENT
echo Email: $EMAIL
echo Site: $GIT_SITE
echo Git Profile: $GIT_PROFILE_NAME

# Generate GPG Key
sh `dirname $0`/git/generate-key.sh "$NAME" "$COMMENT" "$EMAIL"

# Fetch Key ID
KEY_ID=$(sh `dirname $0`/git/get-key-id.sh "$NAME" "$COMMENT" "$EMAIL")
echo "GPG Key generated: $KEY_ID"

# Configure Git

if [ -z "$GIT_PROFILE_NAME" ]; then

echo "Configuring default git profile..."
cat >>~/.gitconfig <<EOF
[user]
     email = $EMAIL
     name = $NAME
     signingkey = $KEY_ID
[commit]
     gpgsign = true
[credential]
     helper = /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
EOF

else

echo "Configuring git profile $GIT_PROFILE_NAME..."
cat >>~/.gitconfig <<EOF
[includeIf "gitdir:$GIT_PROFILE_NAME/"]
     path = .gitconfig-$GIT_PROFILE_NAME
EOF
cat >>~/.gitconfig-$GIT_PROFILE_NAME <<EOF
[user]
     email = $EMAIL
     name = $NAME
     signingkey = $KEY_ID
EOF

fi

if ! [ -z "$GIT_SITE" ]; then
     if [ ! -f "`dirname $0`/git/upload/$GIT_SITE.sh" ]; then
          echo "Git site $GIT_SITE is not supported!"
     else
          sh `dirname $0`/git/upload/$GIT_SITE.sh $KEY_ID
     fi
fi