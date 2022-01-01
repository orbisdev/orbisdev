#!/bin/bash
# Script phase by fjtrujy

## Download the source code.
if test ! -d "orbisdev-liborbis/.git"; then
	git clone https://github.com/orbisdev/orbisdev-liborbis -b newyear && cd orbisdev-liborbis || exit 1
else
	cd orbisdev-liborbis &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

## Determine the maximum number of processes that Make can work with.
PROC_NR=$(getconf _NPROCESSORS_ONLN)

## Build and install.
make --quiet -j $PROC_NR sources || { exit 1; }
make --quiet -j $PROC_NR clean || { exit 1; }
make --quiet -j $PROC_NR || { exit 1; }
make --quiet -j $PROC_NR install || { exit 1; }
make --quiet -j $PROC_NR clean || { exit 1; }
