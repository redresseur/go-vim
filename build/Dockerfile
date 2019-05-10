ARG CODE_VERSION=latest
FROM ubuntu:latest

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

RUN apt-get install ctags

USER 1040:1030
# +q +q cannot be change
RUN vim +PluginInstall +q +q

