## Eliom-base-app
Start your mobile application entirely in OCaml with eliom.

**Eliom base app is in development**

### What is Eliom ?

```
Eliom is a framework for programming web sites and client/server web
applications.
It uses very new concepts making programming very different from all
other web programming tools, and allowing to write a complex web site
in very few lines of code. Both server and client parts of the program are
written in OCaml, as a single program.
```

Source: [Ocisgen website](http://ocsigen.org/eliom/)

### What is Eliom base app ?

```
Eliom-base-app is a set of higher-level libraries for building client-server
web applications with Ocsigen (Js_of_ocaml and Eliom).
```

Source: [Eliom base app github
reposity](https://github.com/ocsigen/eliom-base-app)

### What does this container contain ?
This container uses ocaml/opam:debian image. It pins eliom, eliom-base-app,
macaque, ocsigen-widgets, ojquery and tyxml to the github repository (for
*eliom*, *eliom-base-app* and *ocsigen-widgets* to the mobile branch) and
installs them. It also installs postgresql (needed by eliom) and adds pg_ctl to
the path.

### What does this container not contain ?
This container has no android sdk installed, given you the choice to use a
volume if you have android sdk installed on your machine.
For the same reason, node js, npm and cordova are not installed.

### Useful volumes
* A workspace for your eliom mobile project is created in the opam home. It is
  useful to share this repository to be able to use your development environment
  (such as your editor).
  Use
  ```Shell
  docker run -it -v /srv/docker/eliom-base-app/workspace:/home/opam/workspace
  dannywillems/docker-eliom-base-app
  ```

* Such as said previously, cordova, node js and android sdk are not installed
  to let you the choice to use your existing installation.
  **Don't forget to add npm packages repository to the container path as well
  as android_home variable.**

  ### Start a new eliom mobile application

  Create a new container:
  ```
  docker run -it dannywillems/docker-eliom-base-app bash
  ```

  Update the ocaml version to 4.02.3 with
  ```Shell
  eval `opam config env`
  ```

  To create a new mobile eliom application in the workspace directory, use
  ```
  cd ~/workspace && eliom-distillery -name eliom_is_awesome -template
  eba.pgocaml
  ```
  and answer yes.

  The created project comes with an example. You can build it for android
  with:
  ```
  make android
  ```

  To install directory the application on your android smartphone, you can use
  the target:
  ```
  make install-android
  ```

### What about cordova plugins ?

A binding in OCaml using js_of_ocaml to cordova plugins is done
[here](https://github.com/dannywillems/ocaml-cordova-plugin-list).
