#!/bin/bash
set -e
ARG=$1

if [ "$#" -eq 0 ] ; then
  echo "install_packages.sh <install | reinstall | rootInstall | clean>"
  exit 1
fi

if [ $1 == "rootInstall" ] ; then
  echo "Installing Serverless Libraries";
  npm install
  exit 0
fi

if [ ! -d "node_modules" ] ; then
  echo "Installing Serverless Libraries";
  npm install
fi

cd src

if [ $ARG == "install" ] || [ $ARG ==  "reinstall" ] ; then
  for l in $(find . -mindepth 2 -maxdepth 2 -type d); do
    cd $l

    if [ -a "package.json" ]; then
      [[ $ARG = "reinstall" ]] && rm -rf node_modules && echo "Cleaned $l reinstalling node_modules..." && npm install
      [[ ! -d "node_modules" ]] &&  echo "Installing node_modules... $l" &&  npm install
    fi
  done
  cd - > /dev/null
  echo "Done!"
fi

if [ $ARG == "clean" ] ; then
  for l in $(find . -mindepth 2 -maxdepth 2 -type d); do
    cd $l
     [[ -d "node_modules" ]]  && echo "Cleaning $l" & rm -rf node_modules
  done
    cd - > /dev/null
fi
