# vitessce-api OpenAPI Specification

**Work-in-progress!** Based on [create-openapi-repo](https://github.com/Redocly/create-openapi-repo),
this describes an API [Vitessce](https://github.com/hms-dbmi/vitessce) could consume,
and HuBMAP could provide.

This provides much the same editing interface as Swagger, except on localhost.

Contrasted with SwaggerHub, this approach provides:
- The GitHub ecosystem we're familiar with.
- Intermediate versions can be "published" to S3 for public review, without creating a new version number.
- Final version is published to NPM where it can be referenced like any other dependency.

There are things about this approach which do seem weird to me,
and if there are other tools which better match our needs, please suggest them!

## Develop

1. Install [Node JS](https://nodejs.org/).
2. Clone repo and run `npm install` in the repo root.
3. `npm start` launches the development server.

Running on localhost, you can make edits in the web interface and they will be saved to the local filesystem.

## Publish

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

## Demos and Releases

- 2019-07-10: mccalluc/next-steps: 9102429: [HTML](https://redocly.github.io/redoc/?url=https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-10/9102429/openapi.json) [JSON](https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-10/9102429/openapi.json)
- 2019-07-10: mccalluc/next-steps: 58a816c: [HTML](https://redocly.github.io/redoc/?url=https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-10/58a816c/openapi.json) [JSON](https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-10/58a816c/openapi.json)
- 2019-07-11: mccalluc/next-steps: 295f6ed: [HTML](https://redocly.github.io/redoc/?url=https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-11/295f6ed/openapi.json) [JSON](https://s3.amazonaws.com/vitessce-data/vitessce-api/2019-07-11/295f6ed/openapi.json)
