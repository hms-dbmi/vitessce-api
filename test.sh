#!/usr/bin/env bash
set -o errexit
set -o pipefail

start() { echo travis_fold':'start:$1; echo $1; }
end() { echo travis_fold':'end:$1; }
die() { set +v; echo "$*" 1>&2 ; exit 1; }

NPM_VERSION=`jq .version package.json`
OAS_VERSION=`jq .info.version web_deploy/openapi.json`
[[ "$NPM_VERSION" == "$OAS_VERSION" ]] || die "NPM $NPM_VERSION != OAS $OAS_VERSION"

npm test
