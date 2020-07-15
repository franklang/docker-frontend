** As of 2020/07/15: deprecated in favor of https://github.com/franklang/node-docker **

# NodeJS/NPM based Docker images to compile Front-End assets

This project provides Docker images designed to help processing front-end assets without the pain of having to deal with NodeJS/NPM local installation and package version issues.

Browse project branches to find about covered Front-End frameworks and their versions:
* [Foundation Zurb Template - branch "master"](https://github.com/franklang/docker-frontend/tree/foundation-zurb-template-master)
* [Foundation Zurb Template - branch "v6.4"](https://github.com/franklang/docker-frontend/tree/foundation-zurb-template-v6.4)


## Common prerequisites

* [Docker installed](https://docs.docker.com/install/)
* [Git installed](https://git-scm.com/downloads)


## Customize existing image or build your own

Available NodeJS versions if any change is needed: https://github.com/nodesource/distributions/tree/master/deb.

**Remember to use the raw URL given by Git in your script to avoid code formatting or line ending issues!**

GOOD:
```shell
curl -s https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_6.x
```

BAD:
```shell
curl -s https://github.com/nodesource/distributions/blob/master/deb/setup_6.x
```

_more to come..._


## Docker Tips and tricks

* [Remove one or more Docker image(s)](https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/#removing-docker-images):
```shell
docker image rmi <image_ID>
```
or:
```shell
docker image rm <image_ID> --force
```

* Open a bash to execute commands inside of a Docker image (type "exit" to quit):
```shell
docker run --rm -it <image_name> bash
```


## Common troubleshooting

### Build error

Whenever you run an "npm install" command, look at the logs and if you see something like this:
```shell
npm WARN engine package@version: wanted: {"node":">= 6"} (current: {"node":"4.9.1","npm":"2.15.11"})
```
...try updating provided Dockerfile with suggested version of node.


## TODO

* Better Git organisation
* Add docker-compose.yml
* Add more frameworks (Bootstrap 4, Bulma, ...)
