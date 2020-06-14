#!/bin/bash
# Script phase by fjtrujy

## Download the source code.
if test ! -d "orbisdev-toolchain/.git"; then
	git clone https://github.com/orbisdev/orbisdev-toolchain && cd orbisdev-toolchain || exit 1
else
	cd orbisdev-toolchain &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

## Build and install.
./toolchain.sh || { exit 1; }
