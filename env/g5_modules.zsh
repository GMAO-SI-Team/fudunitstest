#!/usr/bin/sh
#=======================================================================
# name - g5_modules.zsh
# purpose -
#   This script can be "sourced" from the zsh shell to set environment
#   variables and modules needed for building and running the GEOS system.
#
# Notes:
# 1. This script needs to be located in the same directory as g5_modules.
#
#  REVISION HISTORY
#  01Sep2017  pchakrab Not writing to .g5_modules.sh anymore
#  24Aug2012  Stassi   Initial version of code
#=======================================================================

g5ModDir=$( cd "$( dirname "$0" )" && pwd )
g5modules=$g5ModDir/g5_modules
if [ ! -e $g5modules ]; then
   echo "Error. Cannot find $g5modules"
   return 1
fi

# Basedir
export BASEDIR=$(csh $g5modules basedir)

# UDUNITS2_XML_PATH
arch=$(uname -s)
export UDUNITS2_XML_PATH=$BASEDIR/$arch/share/udunits/udunits2.xml

# Modules
source $MODULESHOME/init/zsh
module purge

# This is for non-standard module paths
for usemod in $(csh $g5modules usemodules); do
    module use -a $usemod
done

for mymod in $(csh $g5modules modules); do
    module load $mymod
done

