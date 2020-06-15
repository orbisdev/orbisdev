#!/bin/bash
# Script phase by fjtrujy

PROC_NR=$(getconf _NPROCESSORS_ONLN)

## Download the source code.
if test ! -d "LIEF/.git"; then
	git clone https://github.com/orbisdev/LIEF || exit 1
fi

cd LIEF && git pull && git fetch origin && git reset --hard origin/WIP || exit 1

## Build and install
mkdir build && cd build || { exit 1; }
cmake -DLIEF_PYTHON_API=off -DCMAKE_BUILD_TYPE=Release ..  || { exit 1; }
cmake --build . --target orbis-elf-create --config Release -j$PROC_NR  || { exit 1; }

## Install => Copy to $ORBISDEV/bin
cd examples/cpp && cp orbis-elf-create $ORBISDEV/bin || { exit 1; }
