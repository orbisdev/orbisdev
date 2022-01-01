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

## Build and install.
./build.sh