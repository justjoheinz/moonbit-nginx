This example illustrates how to use a `wasi:http` component as an application for `nginx unit`. `nginx unit` is able to directly instantiate WASM components which adhere to the `wasi:http` specification and utilizes a WASM runtime to server requests.

# Installation

You need `wasm-tools`, `nginx unit` and the `nginx unit wasm support`. On Mac OS X simply do: 

```sh
brew install wasm-tools
brew install nginx/unit/unit nginx/unit/unit-wasm
```

Instead of using curl to communicate with nginx unit, `httpie` can be useful as it has built-in support for json. 

```sh
brew install httpie
```

You also need to install the `wit-bindgen` utilities with support for moonbit. 

The best way is to get them is probably:

```sh 
cargo install --git https://github.com/peter-jerry-ye/wit-bindgen.git\#moonbit wit-bindgen-cli
```

# Running

There is a Makefile which fetches the WIT dependencies, builds the WIT bindings, builds the moonbit WASM and converts it to a component. 

You need to start nginx unit:

```sh
unitd --control 127.0.0.1:9090 --no-daemon --log $(pwd)/unit.log
```

and build the WASM component:

```sh 
make build
make component
```

When that succeeded you can configure nginx unit (unit.config.json contains a hard coded path to your WASM file, please adopt it accordingly):

```sh 
# update the configuration
cat unit.conf.json | http PUT :9090/config
# restart the app
http :9090/control/applications/demo/restart
```

and when that is done you can finally do:

```sh 
http :8091/

HTTP/1.1 200 OK
Date: Sun, 19 Jan 2025 19:39:29 GMT
Server: Unit/1.34.1
Transfer-Encoding: chunked

Hello, World
```

The last steps can also be achieved by issuing:

```sh 
make restart-unit
```


