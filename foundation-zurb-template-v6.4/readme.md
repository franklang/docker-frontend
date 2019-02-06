```shell
$ git clone --branch v6.4 https://github.com/zurb/foundation-zurb-template.git fzt64
```

```shell
$ cd fzt64
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
$ docker build -t fzt64 .
```

```shell
$ rm -rf node_modules
```
(add "sudo" if necessary)

* Use manual setup (not Foundation CLI). See available commands here: https://github.com/zurb/foundation-zurb-template/tree/v6.4#manual-setup

```shell
$ docker run --rm --pid=host -v ~/fzt64:/opt fzt64 npm install
```

```shell
$ docker run --rm --pid=host -v ~/fzt64:/opt fzt64 bower install --allow-root
```

```shell
$ docker run --rm --pid=host -v ~/fzt64:/opt fzt64
```
(= "npm start" command)

```shell
$ docker run --rm --pid=host -v ~/fzt64:/opt fzt64 npm run build
```
(= build assets for production)
