#!/bin/sh
# check-bison.sh by Klairm, used check-wget.sh as tempalte from  Naomi Peori 

## Check for bison.
bison -h 1> /dev/null || { echo "ERROR: Install wget before continuing."; exit 1; }
