#!/bin/bash
set -e

if [ "$AWS_ACCESS_KEY" == "" ] || [ $"$AWS_SECRET" == "" ] ; then
  echo "AWS_ACCESS_KEY or AWS_SECRET is missing be sure exported as ENV variables"
  exit 1
fi

if [ "$ENV" == "" ] ; then
  echo "ENV is not set, please export stage from env parameters"
  exit 1
fi

export AWS_PROFILE="myorganic-${ENV}"

sls deploy --stage $ENV

