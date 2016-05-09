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

RUN opam pin add --no-action eliom-base-app 'https://github.com/ocsigen/eliom-base-app.git#master'
RUN opam pin add --no-action text 'https://github.com/vbmithr/ocaml-text.git#master'
RUN opam pin add --no-action ocsigenserver 'https://github.com/ocsigen/ocsigenserver.git#master'
RUN opam pin add --no-action js_of_ocaml 'https://github.com/ocsigen/js_of_ocaml.git#master'
RUN opam pin add --no-action eliom 'https://github.com/ocsigen/eliom.git#master'
RUN opam pin add --no-action ojquery 'https://github.com/ocsigen/ojquery.git#master'
RUN opam pin add --no-action ocsigen-widgets 'https://github.com/ocsigen/ocsigen-widgets.git#master'
RUN opam pin add --no-action ocsigen-toolkit 'https://github.com/ocsigen/ocsigen-toolkit.git#master'
RUN opam pin add --no-action reactiveData 'https://github.com/ocsigen/reactiveData.git#master'

RUN opam install --deps-only eliom-base-app
RUN opam install --verbose eliom-base-app

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
