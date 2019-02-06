# Docker Front-End images
Use Docker to compile Front-End assets.

Available NodeJS versions if any change is needed: https://github.com/nodesource/distributions/tree/master/deb

## Troubleshooting:

### Build error:

Whenever you run an "npm install" command, look at the logs and if you see something like this:
```shell
npm WARN engine package@version: wanted: {"node":">= 6"} (current: {"node":"4.9.1","npm":"2.15.11"})
```
...try updating provided Dockerfile with suggested version of node.
