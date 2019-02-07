# Docker image: Foundation Zurb Template (starter) v6.4

### Assumptions
We consider you have an existing root folder called "project". Unless noted otherwise, commands within this documentation have to be executed from the root of this "project" folder.

## Getting started

### Get Foundation Zurb Template's sources ready
Clone v6.4 branch of the foundation-zurb-template Git repository in an "assets" folder:  
```shell
$ git clone --branch v6.4 https://github.com/zurb/foundation-zurb-template.git assets
```

Enter "assets" folder:
```shell
$ cd assets
```

At this point, you probably want to remove the ".git" folder:
```shell
$ rm -rf .git
```

Edit "package.json" file to replace the following line:
```json
"gulp": "gulpjs/gulp#4.0",
```
by:
```json
"gulp": "git+https://github.com/gulpjs/gulp#v4.0.0",
```

Edit "gulpfile.babel.js" file to add "open: false" parameter to "server" function:
```js
// Start a server with BrowserSync to preview the site in
function server(done) {
  browser.init({
    server: PATHS.dist, port: PORT, open: false
  }, done);
}
```

### Get Docker image for processing front-end assets ready

**TODO**

## Setup

Build an "fzt64" Docker image:
```shell
$ docker build -t fzt64 .
```

Remove existing "node_modules" folder, if any (add "sudo" in front of the command if necessary):
```shell
$ rm -rf node_modules
```

Execute "npm install" command through the Docker image (do this once at start, then everytime a dependency is added to package.json file):
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install
```

## Docker image available commands:

This Docker image uses Foundation Zurb Template's manual setup (not Foundation CLI).
See available commands here: https://github.com/zurb/foundation-zurb-template/tree/v6.4#manual-setup

Execute "npm start" (Zurb Starter's base command) through the Docker image:
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64
```

Execute "npm run build" to build assets for production through the Docker image:
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm run build
```

## Usage tips: 
* Add new Git repo as dependency into "package.json" file (example with a tagged branch: https://github.com/kenwheeler/slick/tree/v1.8.1):
```shell
$  docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install --save kenwheeler/slick.git#v1.8.1
```

* Add new NPM package as dev dependency into "package.json" file (example: https://www.npmjs.com/package/gulp-svg-sprite):
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install --save-dev gulp-svg-sprite
```
