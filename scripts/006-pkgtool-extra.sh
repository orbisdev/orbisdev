#!/bin/bash
# Script phase by fjtrujy

PROC_NR=$(getconf _NPROCESSORS_ONLN)

## Download the source code.
if test ! -d "LibOrbisPkg/.git"; then
	git clone https://github.com/maxton/LibOrbisPkg || exit 1
fi

cd LibOrbisPkg && git pull && git fetch origin && git reset --hard origin/master || exit 1

## Build and install
dotnet publish -c Release LibOrbisPkg.Core.sln || { exit 1; }

## Install => Copy to $ORBISDEV/bin
mkdir -p $ORBISDEV/bin/pkgtools
cp -R PkgTool.Core/bin/Release/netcoreapp3.0/publish/. $ORBISDEV/bin/pkgtools/
