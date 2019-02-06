**Please note:** this Docker image uses source code from the master branch of Foundation Zurb Template's project. This means code and commands are subject to major changes over time. Thus it might be a better idea to use an image based on a specific branch.

Make sure the Dockerfile follows the requirements (NodeJS version, Git...) or edit provided Dockerfile accordingly: https://github.com/zurb/foundation-zurb-template/tree/master#installation

# Docker image: Foundation Zurb Template (starter) master branch

## Setup:
Clone master branch of Git repository into "foundation-zurb-template" directory:
```shell
$ git clone https://github.com/zurb/foundation-zurb-template.git
```

Enter "foundation-zurb-template" directory:
```shell
$ cd foundation-zurb-template
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

Build a Docker image labelled as "fzt":
```shell
$ docker build -t fzt .
```

Remove existing "node_modules" directory, if any (add "sudo" if necessary):
```shell
$ rm -rf node_modules
```

## Available commands:
Execute "yarn" command through the Docker image (do this once at start, then everytime a dependency is added to package.json file):
```shell
$ docker run --rm --pid=host -v ~/Sites/foundation-zurb-template:/opt fzt yarn
```

This Docker image uses Foundation Zurb Template's manual setup (not Foundation CLI). See available commands here: https://github.com/zurb/foundation-zurb-template#manual-setup

Execute "yarn start" (Zurb Starter's base command) through the Docker image:
```shell
$ docker run --rm --pid=host -v ~/Sites/foundation-zurb-template:/opt fzt
```

Execute "yarn run build" to build assets for production through the Docker image:
```shell
$ docker run --rm --pid=host -v ~/Sites/foundation-zurb-template:/opt fzt yarn run build
```
