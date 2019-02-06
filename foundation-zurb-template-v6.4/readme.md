Clone v6.4 branch of Git repository into "fzt64" directory:  
```shell
$ git clone --branch v6.4 https://github.com/zurb/foundation-zurb-template.git fzt64
```

Enter "fzt64" directory:
```shell
$ cd fzt64
```

Edit package.json to replace the following line:
```json
"gulp": "gulpjs/gulp#4.0",
```
by:
```json
"gulp": "git+https://github.com/gulpjs/gulp#v4.0.0",
```

Edit gulpfile.babel.js to add "open: false" parameter to "server" function:
```js
// Start a server with BrowserSync to preview the site in
function server(done) {
  browser.init({
    server: PATHS.dist, port: PORT, open: false
  }, done);
}
```

Build Docker image:
```shell
$ docker build -t fzt64 .
```

Remove existing "node_modules" directory, if any (add "sudo" if necessary):
```shell
$ rm -rf node_modules
```

Execute "npm install" command through the Docker image (do this once at start, then everytime a dependency is added to package.json file):
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install
```

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

Add Git repo as dependency (example with a tagged branch: https://github.com/kenwheeler/slick/tree/v1.8.1):
```shell
$  docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install --save kenwheeler/slick.git#v1.8.1
```

Add new NPM package as dev dependency (example: https://www.npmjs.com/package/gulp-svg-sprite):
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install --save-dev gulp-svg-sprite
```

Available NodeJS versions if any change is needed: https://github.com/nodesource/distributions/tree/master/deb
