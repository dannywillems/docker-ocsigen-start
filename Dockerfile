FROM ocaml/opam:debian
MAINTAINER Danny Willems "contact@danny-willems.be"

RUN mkdir workspace

RUN sudo apt-get install -y dialog
RUN sudo apt-get install -y postgresql
RUN echo "export PATH=$PATH:/usr/lib/postgresql/9.5/bin" >> /home/opam/.bashrc

RUN opam depext conf-libpcre.1
RUN opam depext conf-openssl.1
RUN opam depext conf-zlib.1
RUN opam depext dbm.1.0
RUN opam depext imagemagick.0.34-1

RUN opam pin add --no-action -y ocsigenserver https://github.com/ocsigen/ocsigenserver.git
RUN opam pin add --no-action -y reactiveData https://github.com/ocsigen/reactiveData.git
RUN opam pin add --no-action -y eliom https://github.com/ocsigen/eliom.git
RUN opam pin add --no-action -y ocsigen-toolkit https://github.com/ocsigen/ocsigen-toolkit.git
RUN opam pin add --no-action -y ocsigen-start https://github.com/ocsigen/ocsigen-start.git
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
