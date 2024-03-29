## *Archived: Not in use, but as sample code might still be interesting.*

The role that had been anticipated for this has instead been taken by the Vitessce JSON Schemas,
and the HuBMAP APIs.

# vitessce-api OpenAPI Specification

**Work-in-progress!** Based on [create-openapi-repo](https://github.com/Redocly/create-openapi-repo),
this describes an API [Vitessce](https://github.com/hubmapconsortium/vitessce) could consume,
and HuBMAP could provide.

## Why?

When running on localhost, this provides much the same editing interface as Swagger.
Contrasted with SwaggerHub, this approach provides:
- The GitHub ecosystem we're familiar with.
- We edit the spec as small files, and a build process assembles the monolithic OAS JSON.
- Intermediate versions can be "published" to S3 for public review, without creating a new version number.
- Final version is published to NPM where it can be referenced like any other dependency.

Out of the box, create-openapi-repo does provide a nice integration with Travis and GitHub Pages,
but it doesn't match our needs right now:
- Only the latest version is visible: Older versions could be regenerated, but they aren't accessible at a URL.
- Waiting for Travis before merging is important, but it shouldn't be necessary to just show a work in progress.

There are things about this approach which do seem weird to me,
and if there are other tools which better match our needs, please suggest them!

## Develop

1. Install [Node JS](https://nodejs.org/).
2. Clone repo and run `npm install` in the repo root.
3. `npm start` launches the development server.

Running on localhost, you can make edits in the web interface and they will be saved to the local filesystem.

## Publish

The publish scripts need `jq`: Install with [homebrew/apt-get/etc.](https://stedolan.github.io/jq/download/).

Work should be done in a feature branch, rather than committing directly to master.
When you have work you'd like others to see, run `./push-s3.sh`:
That will update the list at the bottom of this README.

When there's consensus on a new version of the API, make a release branch, bump the version number,
and run `./push-npm.sh`.

## Use

On another project that wants to use the API spec, run `npm install vitessce-api`,
and then in the code:

```javascript
import { api } from 'vitessce-api';

console.log('Here is your API:', api);
```

## Releases and Demos

### Releases

See [NPM](https://www.npmjs.com/package/vitessce-api).

### Demos

| date | branch | version | git hash | as html | as json |
| ---- | ------ | ------- | -------- | ------- | ------- |
| 2019-07-11 | mccalluc/as-table | 0.0.4-rc | [4f446c6](https://github.com/hms-dbmi/vitessce-api/tree/4f446c6) | [html](https://redocly.github.io/redoc/?url=https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-11/4f446c6/openapi.json) | [json](https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-11/4f446c6/openapi.json) |
| 2019-07-11 | mccalluc/fill-out-end-points | 0.0.4-rc | [1797738](https://github.com/hms-dbmi/vitessce-api/tree/1797738) | [html](https://redocly.github.io/redoc/?url=https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-11/1797738/openapi.json) | [json](https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-11/1797738/openapi.json) |
|  |  | [0.0.4-rc](https://www.npmjs.com/package/vitessce-api/v/0.0.4-rc) |  |  |  |
| 2019-07-11 | mccalluc/fill-out-end-points | 0.0.4 | [e20910d](https://github.com/hms-dbmi/vitessce-api/tree/e20910d) | [html](https://redocly.github.io/redoc/?url=https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-11/e20910d/openapi.json) | [json](https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-11/e20910d/openapi.json) |
|  |  | [0.0.4](https://www.npmjs.com/package/vitessce-api/v/0.0.4) |  |  |  |
