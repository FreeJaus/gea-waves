#!/bin/sh

. ~/.bashrc
cd /geawaves/canal3D/canal3DsRAS_probes/
./Allrun | grep '^Time = '
cat postProcessing/probes/0/*
