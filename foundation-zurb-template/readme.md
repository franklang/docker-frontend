Please note:
* there's no tagged version of the foundation-zurb-template, so I had to start from master branch. This means both code and commands are subject to changes.

Make sure the Dockerfile follows the requirements (NodeJS version, Git...) or edit provided Dockerfile accordingly: https://github.com/zurb/foundation-zurb-template/tree/master#installation

```shell
$ git clone https://github.com/zurb/foundation-zurb-template.git
```

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

```shell
$ docker build -t fzt .
```

```shell
$ rm -rf node_modules
```
(add "sudo" if necessary)

* Use manual setup (not Foundation CLI) and adapt commands accordingly (if needed): https://github.com/zurb/foundation-zurb-template/tree/master#manual-setup

```shell
$ docker run --rm --pid=host -v ~/Sites/some-project:/opt fzt yarn
```

```shell
$ docker run --rm --pid=host -v ~/Sites/some-project:/opt fzt
```
(= "yarn start" command)

```shell
$ docker run --rm --pid=host -v ~/Sites/some-project:/opt fzt yarn run build
```
(= build assets for production)
