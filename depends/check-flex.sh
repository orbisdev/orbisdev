#!/bin/sh
# check-flex.sh by Klairm, used check-wget.sh as tempalte from  Naomi Peori 

## Check for flex.
flex -h 1> /dev/null || { echo "ERROR: Install wget before continuing."; exit 1; }
