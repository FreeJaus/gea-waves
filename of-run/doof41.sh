#!/bin/sh

. ~/.bashrc
cd /geawaves/canal2D/canal2DsRAS_sample/
./Allrun | grep '^Time = '
cat postProcessing/probes/0/*
