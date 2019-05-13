ARG CODE_VERSION=latest
FROM ubuntu:latest

USER root

ENV GOPATH=/gopath
ENV GOROOT=/go
ENV PATH=$PATH:/gopath/bin:/usr/local/bin:/go/bin
ENV HOME=/home/gopher

RUN apt-get update && apt-get install apt-utils -y && apt-get install vim -y && apt-get install git -y && apt-get upgrade -y

RUN groupadd -r -g 1030 docker && useradd --no-log-init -r -m -g 1030 -u 1040 gopher
RUN chown 1040:1030 /bin/bash 

COPY ./bin/* /usr/local/bin/
ADD ./go1.12.5.linux-amd64.tar.gz /


COPY ./.vimrc $HOME/.vimrc
COPY ./.vim $HOME/.vim

RUN chown 1040:1030 $HOME/.vimrc --recursive
RUN chown 1040:1030 $HOME/.vim --recursive

RUN apt-get install ctags -y  && apt-get install curl -y

RUN  curl -sSL -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.11/gosu-$(dpkg --print-architecture)" \
  && chmod +x /usr/local/bin/gosu 

RUN vim +PluginInstall +q +q

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/tail -f"]
