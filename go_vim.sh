#!/bin/bash

volume_root="go_vim_root:/root"
volume_usr="go_vim_usr:/usr"
volume_var="go_vim_var:/var"
volume_etc="go_vim_etc:/etc"

network=host
image="luckydogchian/go_vim:latest"
workdir="/home/gopher"
name="go_vim"

gopath=$1
localdir=$2

docker run -v $volume_root -v $volume_usr -v $volume_etc -v $volume_var\
       	-v $gopath:/gopath -v $localdir:$workdir/workspace --network $network --name $name \
	--rm --workdir $workdir/workspace $image 

