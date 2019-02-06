# docker-frontend
Use Docker to compile Front-End assets

All available NodeJS versions: https://github.com/nodesource/distributions/tree/master/deb

Troubleshooting:

Build error:

Whenever you run an "npm install" command, look at the logs and if you see something like this:
```shell
npm WARN engine readable-stream@3.1.1: wanted: {"node":">= 6"} (current: {"node":"4.9.1","npm":"2.15.11"})
```
...try updating the Dockerfile with suggested version of node.
