# Docker Front-End images
Use Docker to compile Front-End assets.

Available NodeJS versions if any change is needed: https://github.com/nodesource/distributions/tree/master/deb

## Usage tips: 
* Add Git repo as dependency (example with a tagged branch: https://github.com/kenwheeler/slick/tree/v1.8.1):
```shell
$  docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install --save kenwheeler/slick.git#v1.8.1
```

* Add new NPM package as dev dependency (example: https://www.npmjs.com/package/gulp-svg-sprite):
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install --save-dev gulp-svg-sprite
```

## Troubleshooting:

### Build error:

Whenever you run an "npm install" command, look at the logs and if you see something like this:
```shell
npm WARN engine package@version: wanted: {"node":">= 6"} (current: {"node":"4.9.1","npm":"2.15.11"})
```
...try updating provided Dockerfile with suggested version of node.
