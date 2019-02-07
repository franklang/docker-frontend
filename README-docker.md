# Docker image to process Foundation Zurb Template (starter) v6.4 assets

This project provides Docker images designed to help processing front-end assets without the pain of having to deal with NodeJS/NPM local installation and version issues.  
This particular branch is aimed at working with Foundation Zurb Template v6.4 sources.


## Getting started

Let's bring Foundation Zurb Template's source code and this Docker image to work together.

### Get Foundation Zurb Template's sources ready!
Clone v6.4 branch of the foundation-zurb-template Git repository in a folder in which you'll store the front-end source code to be processed: 
```shell
$ git clone --branch v6.4 https://github.com/zurb/foundation-zurb-template.git <front-end_source_code_folder>
```

Enter generated folder:
```shell
$ cd <front-end_source_code_folder>
```

At this point, you probably want to remove the ".git" folder since you won't be contributing to the Foundation Zurb Template project (no, not this time):
```shell
$ rm -rf .git
```

Edit "package.json" file to replace the following line:
(v6.4 known issue workaround: https://github.com/zurb/foundation-cli/issues/109) 
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

### Get Docker image for processing front-end assets ready!
We now have to get the Docker image source code to the root of the folder we previously created to store the front-end source code to be processed.

Exit your <front-end_source_code_folder>:
```shell
$ cd ..
```

Clone foundation-zurb-template-v6.4 branch of the docker-frontend Git repository:
```shell
$ git clone --branch foundation-zurb-template-v6.4 https://github.com/franklang/docker-frontend.git
```

Move content of the previously cloned repository to your <front-end_source_code_folder>:
```shell
$ mv docker-frontend/* <front-end_source_code_folder>/
```

Remove remaining "docker-frontend" folder:
```shell
$ rm -rf docker-frontend/
```


## Setup

Enter your <front-end_source_code_folder>:
```shell
$ cd <front-end_source_code_folder>
```

### Build Docker image
Build an "fzt64" Docker image:
```shell
$ docker build -t fzt64 .
```

### Make sure you start with clean NodeJS dependencies
Remove existing "node_modules" folder, if any (add "sudo" in front of the command if necessary):
```shell
$ rm -rf node_modules
```

Execute "npm install" command through the Docker image (do this once at start, then everytime a dependency is added to package.json file):
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install
```

...and we're finally ready to go!


## Docker image available commands

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


## Usage tips

Add new Git repo as dependency into "package.json" file (example with a tagged branch: https://github.com/jquery/jquery-ui/tree/1.12.1):
```shell
$  docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install --save jquery/jquery-ui.git#v1.12.1
```

Add new NPM package as dev dependency into "package.json" file (example: https://www.npmjs.com/package/gulp-svg-sprite):
```shell
$ docker run --rm --pid=host -v ~/path/to/fzt64:/opt fzt64 npm install --save-dev gulp-svg-sprite
```
