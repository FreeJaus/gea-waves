#!/bin/sh

. ~/.bashrc
cd /geawaves/canal2D/canal2DsRAS_sample/
./Allrun
cat postProcessing/probes/0/*
