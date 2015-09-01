#!/bin/sh
cd ${0%/*} || exit 1    # run from this directory

# Source tutorial run functions
. $WM_PROJECT_DIR/bin/tools/RunFunctions

PreCase () {
  cd $1 || exit
  runApplication blockMesh
  cp 0/alpha.water.org 0/alpha.water
  runApplication setFields
}

PostCase () {
  runApplication paraFoam
  rm 0/alpha.water
}

RunCase () {
  PreCase $1
  runApplication `getApplication`
  PostCase
}

ParRunCase () {
  PreCase $1
  runApplication decomposePar
  runParallel `getApplication` 4
  runApplication reconstructPar
  PostCase
}

RunSnappyCase () {
  cd $1 || exit
  runApplication blockMesh
  runApplication snappyHexMesh

  mkdir constant.bM

  for i in triSurface polyMesh; do
    mv constant/$i constant.bM/
  done

  mv 0.002/* constant/
 
  for i in 0.001 0.002; do
    rm -rf $i;
  done

  checkMesh

  cp 0/alpha.water.org 0/alpha.water
  runApplication setFields

  runApplication `getApplication`

  runApplication paraFoam
  rm 0/alpha.water
}

CheckDir () {
  if [ -d "$2" ]; then
    echo "Running case <$2>"
    $1 $2;
    echo "Case <$2> finished"
  else
    echo "! Directory <$(pwd)/$2> does not exist"
    echo "! Skipping case <$2>"
  fi
}

for f in $@; do
  f=${f%/}
  case $f in
    damBreak           ) CheckDir RunCase $f ;;
    damBreakFine       ) CheckDir ParRunCase $f ;;
    damBreakMod        ) CheckDir RunCase $f ;;
    damBreakSwiftBlock ) CheckDir RunCase $f ;;
    damBreakSnappy     ) CheckDir RunSnappyCase $f;;
    * ) echo "Case <$f> is not supported by this script";;
  esac
done 

# ----------------------------------------------------------------- end-of-file
