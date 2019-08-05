#!/bin/bash
set -e
ARG=$1

if [ "$#" -eq 0 ] ; then
  echo "install_packages.sh <install | reinstall | clean>"
  exit 1
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
      echo "Installing libraries $l..."
      if [ $ARG == "reinstall" ] ; then
        echo "Removing node_modules"
        rm -rf node_modules
      fi
      npm install
    fi
  done
  cd - > /dev/null
  echo "Done!"
fi

if [ $ARG == "clean" ] ; then
  for l in $(find . -mindepth 2 -maxdepth 2 -type d); do
    cd $l
    if [ -d "node_modules" ] ; then
      echo "Cleaning $l"
      rm -rf node_modules
    fi
  done
    cd - > /dev/null
fi
