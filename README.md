# NodeJS/NPM based Docker images to compile Front-End assets

This project provides Docker images designed to help processing front-end assets without the pain of having to deal with NodeJS/NPM local installation and version issues.

Browse project branches to find about covered Front-End frameworks and their versions:
* [Foundation Zurb Template - branch "master"](https://github.com/franklang/docker-frontend/tree/foundation-zurb-template-master)
* [Foundation Zurb Template - branch "v6.4"](https://github.com/franklang/docker-frontend/tree/foundation-zurb-template-v6.4)

Available NodeJS versions if any change is needed: https://github.com/nodesource/distributions/tree/master/deb

## Troubleshooting:

### Build error:

Whenever you run an "npm install" command, look at the logs and if you see something like this:
```shell
npm WARN engine package@version: wanted: {"node":">= 6"} (current: {"node":"4.9.1","npm":"2.15.11"})
```
...try updating provided Dockerfile with suggested version of node.
