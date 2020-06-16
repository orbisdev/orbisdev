#!/bin/sh
# check-orbisdev.sh by Franciso Javier Trujillo Mata (fjtrujy@gmail.com)

## Check if $ORBISDEV is set.
if test ! $ORBISDEV; then { echo "ERROR: Set \$ORBISDEV before continuing."; exit 1; } fi

## Check if $PS4SDK is set.
if test ! $PS4SDK; then { echo "ERROR: Set \$PS4SDK before continuing."; exit 1; } fi

## Check for the $ORBISDEV directory.
ls -ld $ORBISDEV 1> /dev/null || mkdir -p $ORBISDEV 1> /dev/null || { echo "ERROR: Create $ORBISDEV before continuing."; exit 1; }

## Check for the $PS4SDK directory.
ls -ld $PS4SDK 1> /dev/null || mkdir -p $PS4SDK 1> /dev/null || { echo "ERROR: Create $PS4SDK before continuing."; exit 1; }

## Check for $ORBISDEV write permission.
touch $ORBISDEV/test.tmp 1> /dev/null || { echo "ERROR: Grant write permissions for $ORBISDEV before continuing."; exit 1; }

## Check for $PS4SDK write permission.
touch $PS4SDK/test.tmp 1> /dev/null || { echo "ERROR: Grant write permissions for $PS4SDK before continuing."; exit 1; }

## Check for $ORBISDEV/bin in the path.
echo $PATH | grep $ORBISDEV/bin 1> /dev/null || { echo "ERROR: Add $ORBISDEV/bin to your path before continuing."; exit 1; }
