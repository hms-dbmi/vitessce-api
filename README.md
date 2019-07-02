# vitessce-api OpenAPI Specification
[![Build Status](https://travis-ci.com/hms-dbmi/vitessce-api.svg?branch=master)](https://travis-ci.com/hms-dbmi/vitessce-api)

**Work-in-progress!** Based on [create-openapi-repo](https://github.com/Redocly/create-openapi-repo),
this describes an API [Vitessce](https://github.com/hms-dbmi/vitessce) could consume,
and HuBMAP could provide.

## Links

- [Reference Documentation (ReDoc)](https://hms-dbmi.github.io/vitessce-api/)
- [SwaggerUI](https://hms-dbmi.github.io/vitessce-api/swagger-ui/)
- OpenAPI Raw Files: [JSON](https://hms-dbmi.github.io/vitessce-api/openapi.json) [YAML](https://hms-dbmi.github.io/vitessce-api/openapi.yaml)

**Warning:** All above links are updated only after Travis CI finishes deployment

## Working on specification
### Install

1. Install [Node JS](https://nodejs.org/)
2. Clone repo and run `npm install` in the repo root

### Usage

#### `npm start`
Starts the development server.

#### `npm run build`
Bundles the spec and prepares web_deploy folder with static assets.

#### `npm test`
Validates the spec.

#### `npm run gh-pages`
Deploys docs to GitHub Pages. You don't need to run it manually if you have Travis CI configured.
