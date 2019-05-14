FROM luckydogchian/go_vim_baseimage:v0.6
ARG CODE_VERSION=latest
ARG gid=999
ARG uid=1002
ENV GID=${gid}
ENV UID=${uid}

ENV HOME=/home/gopher

#RUN useradd --no-log-init -r -m -g $gid -u $uid gopher
RUN groupadd -r -g $GID go_vim && useradd --no-log-init -r -m -g $GID -u $UID gopher

RUN chown $UID:$GID /bin/bash 

RUN chown $UID:$GID $HOME
RUN chown $UID:$GID $HOME/.vim --recursive
RUN chown $UID:$GID $HOME/.vimrc 
RUN vim -c PluginInstall -c q -c q

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/tail -f"]
