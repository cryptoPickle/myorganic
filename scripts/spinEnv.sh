#!/bin/bash

curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
export NVM_DIR="/opt/circleci/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install v10
nvm alias default v10
nvm install -g npm
npm i jest -g
echo 'export NVM_DIR="/opt/circleci/.nvm"' >> $BASH_ENV
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\"" >> $BASH_ENV