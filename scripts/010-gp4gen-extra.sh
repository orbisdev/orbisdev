#!/bin/bash
# Script phase by fjtrujy

PROC_NR=$(getconf _NPROCESSORS_ONLN)

## Download the source code.
REPO_URL="https://github.com/orbisdev/orbisdev-gp4gen"
REPO_FOLDER="orbisdev-gp4gen"
BRANCH_NAME="main"
if test ! -d "$REPO_FOLDER"; then
	git clone --depth 1 -b $BRANCH_NAME $REPO_URL && cd $REPO_FOLDER || exit 1
else
	cd $REPO_FOLDER && git fetch origin && git reset --hard origin/${BRANCH_NAME} || exit 1
fi

## Compile and install.
make --quiet -j $PROC_NR clean   || { exit 1; }
make --quiet -j $PROC_NR || { exit 1; }
make --quiet -j $PROC_NR install || { exit 1; }
make --quiet -j $PROC_NR clean   || { exit 1; }
