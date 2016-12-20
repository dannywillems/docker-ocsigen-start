FROM ocaml/opam:debian
MAINTAINER Danny Willems "contact@danny-willems.be"

RUN mkdir workspace

RUN sudo apt-get install -y dialog

RUN opam depext conf-libpcre.1
RUN opam depext conf-openssl.1
RUN opam depext conf-zlib.1
RUN opam depext dbm.1.0

RUN opam install ocsigen-start -y

# ##### Install node js
# ##### It is recommended to use volumes to share with your existing node js,
# ##### cordova and android development installation
# USER root
# RUN apt-get install curl
# RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
# RUN apt-get install --yes nodejs

# ##### Install cordova
# ##### It is recommended to use volumes to share with your existing node js,
# ##### cordova and android development installation
# USER opam
# RUN sudo npm install -g cordova
