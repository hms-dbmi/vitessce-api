#!/usr/bin/env bash
set -o errexit
set -o pipefail

./push-s3.sh

echo 'Generating index.js...'

API_JSON=`cat web_deploy/openapi.json`
DATE=`date "+%Y-%m-%d"`
FULL_JSON="{ regeneratedDate: '$DATE', api: $API_JSON }"

echo "// DO NOT hand edit! Regenerated on $DATE.
module.exports = $FULL_JSON;" > index.js

npm publish

echo 'Published to NPM!'
