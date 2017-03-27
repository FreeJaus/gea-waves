FROM fedora:latest

RUN dnf -y update \
 && dnf install -y wget tar findutils gcc-c++ llvm make flex openmpi-devel zlib-devel boost-devel git \
 && dnf clean all --enablerepo=\* \
 && wget -O - http://dl.openfoam.org/source/3-0-0 | tar xvz \
 && wget -O - http://dl.openfoam.org/third-party/3-0-0 | tar xvz \
 && mv OpenFOAM-3.0.0-version-3.0.0 $HOME/OpenFOAM-3.0.0 \
 && mv ThirdParty-3.0.0-version-3.0.0 $HOME/ThirdParty-3.0.0 \
 && export PATH=$PATH:/usr/lib64/openmpi/bin \
 && . $HOME/OpenFOAM-3.0.0/etc/bashrc && . $HOME/.bashrc \
 && cd $HOME/ThirdParty-3.0.0 && /bin/bash -c "./Allwmake -j" \
 && cd $HOME/OpenFOAM-3.0.0 && /bin/bash -c "./Allwmake" \
 && echo "" >> /etc/bashrc && echo "export PATH=$PATH:/usr/lib64/openmpi/bin && . $HOME/OpenFOAM-3.0.0/etc/bashrc" >> /etc/bashrc \

