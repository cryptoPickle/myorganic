#!/bin/bash

set -e

for d in $(find ./src -mindepth 2 -maxdepth 2 -type d); do
  cd $d

  [[ -d "tests" ]] && echo "Running tests for $d" && jest
done