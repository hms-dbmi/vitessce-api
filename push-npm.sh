#!/usr/bin/env bash
set -o errexit
set -o pipefail

./push-s3.sh

echo 'Generating index.js...'

JSON=`cat web_deploy/openapi.json`
DATE=`date "+%Y-%m-%d"`

echo "// DO NOT hand edit! Regenerated on $DATE.
module.exports = $JSON;" > index.js

npm publish

echo 'Published to NPM!'
