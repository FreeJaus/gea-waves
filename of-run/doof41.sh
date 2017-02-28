#!/bin/sh

. ~/.bashrc
cd /geawaves/canal2D/canal2DsRAS_sample/
./Allrun | grep '^Time = '
cat postProcessing/probes/0/*

cd /geawaves/canal3D/canal3DsRAS_probes/
./Allrun | grep '^Time = '
cat postProcessing/probes/0/*
