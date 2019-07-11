#!/usr/bin/env bash
set -o errexit
set -o pipefail

die() { set +v; echo "$*" 1>&2 ; exit 1; }

./push-s3.sh

JSON=`cat web_deploy/openapi.json`
DATE=`date "+%Y-%m-%d"`

echo "// DO NOT hand edit! Regenerated on $DATE.
module.exports = $JSON;" > index.js

# npm publish
