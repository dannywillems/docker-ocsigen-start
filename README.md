## Ocsigen Start
Start your mobile application entirely in OCaml with eliom.

**Ocsigen Start is in development**

### What is Eliom?

```
Eliom is a framework for programming web sites and client/server web
applications.
It uses very new concepts making programming very different from all
other web programming tools, and allowing to write a complex web site
in very few lines of code. Both server and client parts of the program are
written in OCaml, as a single program.
```

Source: [Ocisgen website](http://ocsigen.org/eliom/)

### What is Ocsigen Start?

```
Ocsigen Start is a set of higher-level libraries for building client-server
web applications with Ocsigen (Js_of_ocaml and Eliom).
```

Source: [Ocsigen Start github
reposity](https://github.com/ocsigen/Ocsigen Start)

### What does this container contain?

This container uses `ocaml/opam:debian` image.
It also installs PostgreSQL (needed by Ocsigen Start).

### What does this container not contain?

This container has no Android SDK installed, given you the choice to use a
volume if you have Android SDK installed on your machine.
For the same reason, NodeJS, NPM and Cordova are not installed.

### Useful volumes
* A workspace for your eliom mobile project is created in the OPAM home. It is
  useful to share this repository to be able to use your development environment
  (such as your editor).
  Use
  ```Shell
  docker run -it \
    -v /home/opam/workspace \
    dannywillems/docker-ocsigen-start
  ```

* Such as said previously, Cordova, NodeJS and Android SDK are not installed
  to let you the choice to use your existing installation.
  **Don't forget to add NPM packages repository to the container path as well
  as `android_home` variable.**

  ### Start a new eliom mobile application

  Create a new container:
  ```Shell
  docker run -it dannywillems/docker-ocsigen-start bash
  ```

  Update and upgrade (if needed) OPAM packages
  ```Shell
  eval `opam config env`
  opam update && opam upgrade
  ```

  To create a new mobile eliom application in the workspace directory, use
  ```Shell
  cd ~/workspace
  eliom-distillery -y -name eliom_is_awesome -template os.pgocaml
  ```

  The created project comes with an example. You can build it for Android
  with:
  ```Shell
  make android
  ```

  To install and run the application on your Android smartphone, you can use
  ```Shell
  make run-android
  ```

### What about Cordova plugins?

A binding in OCaml using `gen_js_api` to Cordova plugins is done
[here](https://github.com/dannywillems/ocaml-cordova-plugin-list).
