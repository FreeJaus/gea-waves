FROM fsys/openfoam4-paraview50-cfmesh
USER root
RUN  apt-get update && apt-get install -y python3-pip \
  && pip3 install PyFoam
USER 98765
CMD ["salome"]