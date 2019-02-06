Please note: there's no tagged version of the foundation-zurb-template, so I had to start from master branch. This means code is subject to changes.

Make sure the Dockerfile follows those requirements or adapt accordingly: https://github.com/zurb/foundation-zurb-template/tree/master#installation

```shell
$ git clone https://github.com/zurb/foundation-zurb-template.git
```

```json
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

```json
$ docker build -t fzt .
```

```json
$ rm -rf node_modules
```
(add "sudo" if necessary)

* Use manual setup (not Foundation CLI) and adapt commands accordingly (if needed): https://github.com/zurb/foundation-zurb-template/tree/master#manual-setup

```json
$ docker run --rm --pid=host -v ~/Sites/some-project:/opt fzt yarn
```

```json
$ docker run --rm --pid=host -v ~/Sites/some-project:/opt fzt
```
(= "yarn start" command)

```json
$ docker run --rm --pid=host -v ~/Sites/some-project:/opt fzt yarn run build
```
(= build assets for production)
