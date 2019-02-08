**Please note:** this Docker image uses source code from the master branch of Foundation Zurb Template's project. This means code and commands are subject to daily and major changes over time. Thus it is not a good idea to start developing you site or application on this base. Better use a Docker image based on any of the other [specific branch labelled with a version number](https://github.com/franklang/docker-frontend).

You can use this branch for testing purpose or as a starting point if you want to create a Docker image for a further Foundation Zurb Template release. But you'll most probably have to adapt Dockerfile accordingly.


# Docker image to process Foundation Zurb Template (starter) MASTER branch front-end assets

This project provides Docker images designed to help processing front-end assets without the pain of having to deal with NodeJS/NPM local installation and package version issues.  
This particular branch is aimed at working with Foundation Zurb Template MASTER branch sources.


## Prerequisites
* Git installed
* Docker installed


## Getting started

Let's bring Foundation Zurb Template's source code and this Docker image to work together.

### Get Foundation Zurb Template's sources ready!
Clone master branch of the foundation-zurb-template Git repository in a folder in which you'll store the front-end source code to be processed: 
```shell
$ git clone https://github.com/zurb/foundation-zurb-template.git <front-end_source_code_folder>
```

Enter generated folder:
```shell
$ cd <front-end_source_code_folder>
```

At this point, you probably want to remove the ".git" folder since you won't be contributing to the Foundation Zurb Template project (no, not this time):
```shell
$ rm -rf .git
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

Clone foundation-zurb-template-master branch of the docker-frontend Git repository:
```shell
$ git clone --branch foundation-zurb-template-master https://github.com/franklang/docker-frontend.git
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

Re-enter your <front-end_source_code_folder>:
```shell
$ cd <front-end_source_code_folder>
```

### Build Docker image
Build an "fztm" Docker image (this may take a few minutes):
```shell
$ docker build -t fztm .
```

### Make sure you start with clean NodeJS dependencies
Remove existing "node_modules" folder, if any (add "sudo" in front of the command if necessary):
```shell
$ rm -rf node_modules
```

Execute "yarn" command through the Docker image (do this once at start, then everytime a dependency is added to package.json file):
```shell
$ docker run --rm --pid=host -v ~/path/to/<front-end_source_code_folder>:/opt fztm yarn
```

...and we're finally ready to go!


## Docker image available commands

This Docker image uses Foundation Zurb Template's manual setup (not Foundation CLI).
See available commands here: https://github.com/zurb/foundation-zurb-template/tree/master#manual-setup

* Execute "yarn start" (Zurb Starter's base command) through the Docker image:
```shell
$ docker run --rm --pid=host -v ~/path/to/<front-end_source_code_folder>:/opt fztm
```

If you've executed this command for the first time, it should have created a "dist" folder at the root of your <front-end_source_code_folder>. This "dist" folder contains your processed front-end assets.

* Execute "yarn run build" to build assets for production through the Docker image:
```shell
$ docker run --rm --pid=host -v ~/path/to/<front-end_source_code_folder>:/opt fztm yarn run build
```


## Usage tips

* Use Yarn (not NPM) to add dependencies to package.json file: https://yarnpkg.com/lang/en/docs/cli/add/.
