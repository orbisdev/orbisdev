#!/bin/bash
# Script phase by fjtrujy

## Download the source code.
if test ! -d "orbisdev-orbisGl/.git"; then
	git clone https://github.com/orbisdev/orbisdev-orbisGl && cd orbisdev-orbisGl || exit 1
else
	cd orbisdev-orbisGl &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

## Build and install.
make --quiet clean && make --quiet && make --quiet install && make --quiet clean || { exit 1; }
