#!/usr/bin/env bash
set -o errexit
set -o pipefail

die() { set +v; echo "$*" 1>&2 ; exit 1; }

npm run build
./test.sh
git diff --quiet || die 'Uncommitted changes: Stash or commit before pushing demo.'

BRANCH=`git rev-parse --abbrev-ref HEAD`
DATE=`date "+%Y-%m-%d"`
HASH=`git rev-parse --short HEAD`
VERSION=`jq -r .version package.json`
DEST_PATH="vitessce-data/vitessce-api/$DATE/$HASH/openapi.json"

aws s3 cp web_deploy/openapi.json "s3://$DEST_PATH"
DEST_URL="https://s3.amazonaws.com/$DEST_PATH"

echo "| $DATE | $BRANCH | $VERSION | [$HASH](https://github.com/hms-dbmi/vitessce-api/tree/$HASH) | [html](https://redocly.github.io/redoc/?url=$DEST_URL) | [json]($DEST_URL) |" >> README.md
