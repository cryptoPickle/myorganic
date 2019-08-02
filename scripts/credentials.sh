#!/bin/bash
set -e

USAGE="./credentials.sh <env>"

if [ "$#" -ne 1 ] ; then
    echo "Illegal number of parameters"
    echo "Usage: $USAGE"
fi

ENV=$1

CONFIG="[default]\nregion=eu-west-1\noutput=json"

KEY_ID="${ENV}_key_id"
ACCESS_KEY="${ENV}_access_key"

CREDENTIALS="[myorganic-${ENV}]\naws_access_key_id = ${!KEY_ID}\naws_secret_access_key = ${!ACCESS_KEY}"

mkdir ~/.aws
echo -e ${CONFIG} > ~/.aws/config
echo -e ${CREDENTIALS} > ~/.aws/credentials