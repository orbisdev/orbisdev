#!/bin/sh
# check-m4.sh by Klairm, used check-wget.sh as tempalte from  Naomi Peori 

## Check for m4.
m4 --help 1> /dev/null || { echo "ERROR: Install wget before continuing."; exit 1; }
