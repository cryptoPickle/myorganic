#!/bin/sh

cd ../src

for l in $(find . -mindepth 2 -maxdepth 2 -type d); do
  cd $l

  if [ -a "package.json" ]; then
    echo "Installing libraries $l..."
    npm install
  fi
done

echo "Done!"