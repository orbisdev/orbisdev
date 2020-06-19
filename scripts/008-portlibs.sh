#!/bin/bash
# Script phase by fjtrujy

## Download the source code.
if test ! -d "orbisdev-portlibs/.git"; then
	git clone https://github.com/orbisdev/orbisdev-portlibs && cd orbisdev-portlibs || exit 1
else
	cd orbisdev-portlibs &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

## Build and install.
make --quiet clean && make --quiet && make --quiet install && make --quiet clean || { exit 1; }
