ARG CODE_VERSION=latest
FROM ubuntu:latest

RUN apt-get update && apt-get install apt-utils -y && apt-get install vim -y && apt-get install git -y && apt-get upgrade -y
RUN apt-get install ctags -y  && apt-get install curl -y

RUN apt-get install python -y

RUN  curl -sSL -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.11/gosu-$(dpkg --print-architecture)" \
  && chmod +x /usr/local/bin/gosu 

ADD ./plugin.tar.gz /usr/local/
ADD ./go1.12.5.linux-amd64.tar.gz /

ENV GOPATH=/gopath
ENV GOROOT=/go
ENV PATH=$PATH:/gopath/bin:/usr/local/bin:/go/bin
ENV HOME=/home/gopher

COPY ./.vim $HOME/.vim
COPY ./.vimrc $HOME/.vimrc

RUN apt-get install cmake -y && apt-get install python-dev -y

RUN apt-get install -y build-essential

RUN cd $HOME/.vim/bundle/YouCompleteMe/ && python install.py --go-completer
