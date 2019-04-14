#!/bin/bash
NAME=$1
COMMENT=$2
EMAIL=$3
GIT_SITE=$4
GIT_PROFILE_NAME=$5

if [ -z "$NAME" ];
then
     printf "Please enter your name: "
     read NAME
fi

if [ -z "$COMMENT" ];
then
     printf "Please enter a comment for the GPG key: "
     read COMMENT
fi

if [ -z "$EMAIL" ];
then
     printf "Please enter your email: "
     read EMAIL
fi

if [ -z "$GIT_SITE" ];
then
     printf "Please enter your git host [github, gitlab] (Leave blank to not autoupload your key): "
     read GIT_SITE
fi

if [ -z "$GIT_PROFILE_NAME" ];
then
     printf "Please give this git config a name, this config will be used when in a project with a folder of that name is present in the path. Leave empty to setup the default config: "
     read GIT_PROFILE_NAME
fi

echo Name: $NAME
echo Comment: $COMMENT
echo Email: $EMAIL
echo Site: $GIT_SITE
echo Git Profile: $GIT_PROFILE_NAME

printf "Confirm creation of git settings including gpg keys? [y/n]: "
read REPLY
if [ ! $REPLY = "y" ];
then
    exit 1
fi

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