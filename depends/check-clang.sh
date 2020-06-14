#!/bin/sh
# check-clang.sh by fjtrujy (fjtrujy@gmail.com)

## Check for clang.
clang --version 1> /dev/null || { echo "ERROR: Install clang before continuing."; exit 1; }
