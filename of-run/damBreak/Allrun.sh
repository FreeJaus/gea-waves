#!/bin/sh
cd ${0%/*} || exit 1    # Run from this directory

# Source tutorial run functions
. $WM_PROJECT_DIR/bin/tools/RunFunctions

# Get application name
application=`getApplication`

runApplication blockMesh
cp 0/alpha.water.org 0/alpha.water
runApplication setFields
runApplication $application

#------------------------------------------------------------------------------
