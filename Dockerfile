FROM ocaml/opam:debian
MAINTAINER Danny Willems "contact@danny-willems.be"

RUN mkdir workspace

RUN sudo apt-get install -y dialog
RUN sudo apt-get install -y postgresql
RUN echo "export PATH=$PATH:/usr/lib/postgresql/9.4/bin" >> /home/opam/.bashrc

RUN opam depext conf-libpcre.1
RUN opam depext conf-openssl.1
RUN opam depext conf-zlib.1
RUN opam depext dbm.1.0
RUN opam depext imagemagick.0.34-1

RUN opam pin -n add ojquery https://github.com/ocsigen/ojquery.git
RUN opam pin -n add macaque https://github.com/ocsigen/macaque.git
RUN opam pin -n add ocsigen-widgets https://github.com/ocsigen/ocsigen-widgets.git\#mobile
RUN opam pin -n add tyxml https://github.com/ocsigen/tyxml.git
RUN opam pin -n add eliom https://github.com/ocsigen/eliom.git\#mobile
RUN opam pin -n add eliom-base-app https://github.com/ocsigen/eliom-base-app.git\#mobile

RUN opam install ojquery macaque ocsigen-widgets tyxml eliom eliom-base-app

RUN echo "export PATH=$PATH:/usr/lib/postgresql/9.4/bin:/home/opam/.opam/4.02.3/bin" >> /home/opam/.bashrc

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
