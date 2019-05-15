#!/bin/bash

set -e
#gosu root chmod +066 $HOME/workspace -R
exec -c gosu gopher $@
#exec -c $@
