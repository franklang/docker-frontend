**Please note:** this Docker image uses source code from the master branch of Foundation Zurb Template's project. This means code and commands are subject to daily and major changes over time. Thus it is not a good idea to start developing you site or application on this base. Better use a Docker image based on any of the other [specific branch labelled with a version number](https://github.com/franklang/docker-frontend).

You can use this branch for testing purpose or as a starting point if you want to create a Docker image for a further Foundation Zurb Template release. But you'll most probably have to adapt Dockerfile accordingly.


# Docker image to process Foundation Zurb Template (starter) MASTER branch front-end assets

This project provides Docker images designed to help processing front-end assets without the pain of having to deal with NodeJS/NPM local installation and package version issues.  
This particular branch is aimed at working with [Foundation Zurb Template MASTER branch sources](https://github.com/zurb/foundation-zurb-template).


## Prerequisites
* [Docker installed](https://docs.docker.com/install/)
* [Git installed](https://git-scm.com/downloads)


## Getting started

Let's bring Foundation Zurb Template's source code and this Docker image to work together.

There are two ways of using this image, depending on your needs:
* [Pulling it directly from Docker Hub](#docker-pull) (faster, but you'll only be able to use the image as is)
* [Cloning it from this Github repository/branch to your local development environment](#git-clone) (slower, as you'll have to build the image manually, but you'll be able to customize it to suit your project species and save it for further use)


## <a name="docker-pull"></a>Solution #1. Pull image from Docker Hub

Execute:
```shell
$ docker pull franklang/fztm
```

You can check if your image has been correctly created:
```shell
$ docker image ls
```
```shell
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
franklang/fztm                latest              6841c695963f        50 seconds ago      494MB
```

From now on, whenever you see a `<REPOSITORY_name>` mention in this documentation, it refers to the pulled image's name: _franklang/fztm_. [Check here for available commands](#available-commands).

**But wait!** We still [need to do a couple of minor modifications to Foundation's provided configuration files](#before-you-start) before we can start using this Docker image properly! 


## <a name="git-clone"></a>Solution #2. Clone image from Github repository

### Get Foundation Zurb Template's sources ready!
Clone master branch of the foundation-zurb-template Git repository in a folder in which you'll store the front-end source code to be processed: 
```shell
$ git clone https://github.com/zurb/foundation-zurb-template.git <front-end_source_code_folder>
```

Enter generated folder:
```shell
$ cd <front-end_source_code_folder>
```

At this point, you probably want to remove the _.git_ folder since you won't be contributing to the Foundation Zurb Template project (no, not this time):
```shell
$ rm -rf .git
```

### Get Docker image for processing front-end assets ready!
We now have to get the Docker image source code to the root of the folder we previously created to store the front-end source code to be processed.

Exit your <front-end_source_code_folder>:
```shell
$ cd ..
```

Clone _foundation-zurb-template-master_ branch of the _docker-frontend_ Git repository:
```shell
$ git clone --branch foundation-zurb-template-master https://github.com/franklang/docker-frontend.git
```

Move content of the previously cloned repository to your <front-end_source_code_folder>:
```shell
$ mv docker-frontend/* <front-end_source_code_folder>/
```

Remove remaining _docker-frontend_ folder:
```shell
$ rm -rf docker-frontend/
```


### Setup

Re-enter your <front-end_source_code_folder>:
```shell
$ cd <front-end_source_code_folder>
```

#### Build Docker image
Build an `fztm` Docker image (this may take a few minutes):
```shell
$ docker build -t fztm .
```

You can check if your image has been correctly created:
```shell
$ docker image ls
```
```shell
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
fztm                latest              6841c695963f        50 seconds ago      494MB
```

From now on, whenever you see a `<REPOSITORY_name>` mention in this document, it refers to the cloned image's name: _fztm_. [Check here for available commands](#available-commands).


## <a name="before-you-start"></a>Before you start processing your assets...

### Bring a couple of minor (but necessary) modifications to Foundation's configuration files
Enter your <front-end_source_code_folder>:
(files like `gulpfile.babel.js` and `package.json` must be located at the root of this folder!)
```shell
$ cd <front-end_source_code_folder>
```

Edit _gulpfile.babel.js_ file to add `open: false` parameter to `server` function:
```js
// Start a server with BrowserSync to preview the site in
function server(done) {
  browser.init({
    server: PATHS.dist, port: PORT, open: false
  }, done);
}
```

### Make sure you start with clean NodeJS dependencies
Remove existing _node_modules_ folder, if any (add `sudo` in front of the command if necessary):
```shell
$ rm -rf node_modules
```

Execute `yarn` command through the Docker image to get all needed project dependencies (this will generate a fresh _node_modules_ folder - do this once at start, then everytime a dependency is added to _package.json_ file):
```shell
$ docker run --rm --pid=host -v ~/path/to/<front-end_source_code_folder>:/opt <REPOSITORY_name> yarn
```

...and we're finally ready to go!


## <a name="available-commands"></a>List of available commands

This Docker image uses Foundation Zurb Template's manual setup (not Foundation CLI).
See available commands here: https://github.com/zurb/foundation-zurb-template/tree/master#manual-setup

* Execute `yarn start` (Zurb Starter's base command) through the Docker image:
```shell
$ docker run --rm --pid=host -v ~/path/to/<front-end_source_code_folder>:/opt <REPOSITORY_name>
```

If you've executed this command for the first time, it should have created a _dist_ folder at the root of your <front-end_source_code_folder>. This _dist_ folder contains your processed front-end assets.

* Execute `yarn run build` to build assets for production through the Docker image:
```shell
$ docker run --rm --pid=host -v ~/path/to/<front-end_source_code_folder>:/opt <REPOSITORY_name> yarn run build
```


## Usage tips

* Use Yarn (not NPM) to add dependencies to package.json file: https://yarnpkg.com/lang/en/docs/cli/add/.

* Add new Git repo as dependency into _package.json_ file (example with a tagged branch: https://github.com/jquery/jquery-ui/tree/1.12.1):
```shell
$  docker run --rm --pid=host -v ~/path/to/<front-end_source_code_folder>:/opt <REPOSITORY_name> yarn add jquery/jquery-ui.git#v1.12.1
```

* Add new NPM package as dev dependency into _package.json_ file (example: https://www.npmjs.com/package/gulp-svg-sprite):
```shell
$ docker run --rm --pid=host -v ~/path/to/<front-end_source_code_folder>:/opt <REPOSITORY_name> yarn add --dev gulp-svg-sprite
```

