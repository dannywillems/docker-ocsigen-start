## Ocsigen Start
Start your mobile application entirely in OCaml with eliom.

**Ocsigen Start is in development**

### What is Eliom?

```
Eliom is a framework for building client/server Web and mobile applications 
in OCaml. It transforms OCaml into a multi-tier language, making it possible to
implement both the server and client parts of a Web and mobile app as a single
program.
Applications can run on any Web browser or mobile device (iOS,Android), saving
from the need to develop one version for each platform.

Eliom has support for reactive pages (generated on server or client),
advanced session mechanism, server to client communication,
continuation based Web programming, etc.
```

Source: [Ocisgen website](http://ocsigen.org/eliom/)

### What is Ocsigen Start?

```
Ocsigen Start is an application template written with Eliom, Js_of_ocaml,
Ocsigen Toolkit, etc. It contains many standard features like user management, 
notifications, and many code examples.
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
