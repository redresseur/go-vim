#!/bin/sh
image="luckydogchian/go_vim_baseimage:v0.6"
docker pull $image
mkdir -p /etc/go_vim_config/
cp go_vim.conf /etc/go_vim_config
cp go_vim_service.sh /usr/local/bin/
cp bin/go_vim.sh /usr/local/bin
chmod 754 go_vim.service
cp go_vim.service /lib/systemd/system/

systemctl enable go_vim.service
