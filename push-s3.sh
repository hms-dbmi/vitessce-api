#!/usr/bin/env bash
set -o errexit
set -o pipefail

die() { set +v; echo "$*" 1>&2 ; exit 1; }
git diff --quiet || die 'Uncommitted changes: Stash or commit before pushing demo.'

npm run build  # TODO: Is there some way to see if there are changes since last build?

BRANCH=`git rev-parse --abbrev-ref HEAD`
DATE=`date "+%Y-%m-%d"`
HASH=`git rev-parse --short HEAD`
DEST_PATH="vitessce-data/vitessce-api/$DATE/$HASH/openapi.json"

aws s3 cp web_deploy/openapi.json "s3://$DEST_PATH"
DEST_URL="https://s3.amazonaws.com/$DEST_PATH"

echo "- $DATE: $BRANCH: $HASH: [HTML](https://redocly.github.io/redoc/?url=$DEST_URL) [JSON]($DEST_URL)" >> README.md
