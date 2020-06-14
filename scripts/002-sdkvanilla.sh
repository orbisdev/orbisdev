#!/bin/bash
# Script phase by fjtrujy

## Download the source code.
if test ! -d "orbisdev-sdkvanilla/.git"; then
	git clone https://github.com/orbisdev/orbisdev-sdkvanilla && cd orbisdev-sdkvanilla || exit 1
else
	cd orbisdev-sdkvanilla &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

## Build and install.
./build.sh || { exit 1; }
