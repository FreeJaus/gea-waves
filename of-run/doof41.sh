#!/bin/sh

. ~/.bashrc
cd /geawaves/canal2D/canal2DsRAS_sample/
blockMesh 1>> log.log 2>&1
setFields 1>> log.log 2>&1
interFoam 1>> log.log 2>&1
cat postProcessing/probes/0/*
