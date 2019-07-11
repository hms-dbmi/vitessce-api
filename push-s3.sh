#!/usr/bin/env bash
set -o errexit
set -o pipefail

die() { set +v; echo "$*" 1>&2 ; exit 1; }

npm run build
./test-version.sh
git diff --quiet || die 'Uncommitted changes: Stash or commit before pushing demo.'

BRANCH=`git rev-parse --abbrev-ref HEAD`
DATE=`date "+%Y-%m-%d"`
HASH=`git rev-parse --short HEAD`
VERSION=`jq -r .version package.json`
DEST_PATH="vitessce-data/vitessce-api/$DATE/$HASH/openapi.json"

aws s3 cp web_deploy/openapi.json "s3://$DEST_PATH"
JSON_URL="https://s3.amazonaws.com/$DEST_PATH"
HTML_URL="https://redocly.github.io/redoc/?url=$DEST_URL"
GITHUB_URL="https://github.com/hms-dbmi/vitessce-api/tree/$HASH"

echo "| $DATE | $BRANCH | $VERSION | [$HASH]($GITHUB_URL) | [html]($HTML_URL) | [json]($JSON_URL) |" >> README.md
echo "Demo: $HTML_URL"
