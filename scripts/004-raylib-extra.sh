#!/bin/bash
# Script phase by fjtrujy

## Download the source code.
if test ! -d "orbisdev-raylib/.git"; then
	git clone https://github.com/orbisdev/orbisdev-raylib && cd orbisdev-raylib || exit 1
else
	cd orbisdev-raylib &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

## Determine the maximum number of processes that Make can work with.
PROC_NR=$(getconf _NPROCESSORS_ONLN)

## Build and install.
./raylib4Orbis.sh
make --quiet -j $PROC_NR install || { exit 1; }
