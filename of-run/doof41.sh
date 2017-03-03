#!/bin/sh

. ~/.bashrc
cd /geawaves/canal3D/canal3DsRAS_refi/
./Allrun | grep '^Time = '
#cat postProcessing/probes/0/*
