#!/bin/bash

if [ $# -lt "1" ]; then
	echo ""
fi

option=$1
workspace=/home/gopher/workspace

case $option in
	"add")
		docker exec go_vim chmod +066 -R $workspace/
	;;
        "open")
		dir=$2
		dir="$workspace/$dir"
		docker exec -u gopher:go_vim -it go_vim vim $dir
	;;
        "bash")
		docker exec -u gopher:go_vim -it go_vim  /bin/bash
	;;
        *)
	;;
esac

