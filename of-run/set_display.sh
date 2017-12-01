#!/bin/sh
if [ "$(uname | cut -c1-5)" = "MINGW" ]; then
  XMING_PATH="/c/Program\ Files\ \(x86\)/Xming/Xming.exe"
  DOCKER_DISPLAY="`ipconfig | grep 'IPv4' | grep -o '[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*' | grep "^10\.0\.*"`:0"
  else
  DOCKER_DISPLAY=unix$DISPLAY  
fi	

check_c() { r="1"; if [ -n "$(docker container inspect $1 2>&1 | grep "Error:")" ]; then r="0"; fi; echo "$r"; }
rm_c() {
  echo ""
  echo "Removing container $1"
  if [ "$(check_c $1)" = "1" ]; then docker rm -f "$1"; fi;
}

test_xdpyinfo() { docker run --rm -t $GUIAPP gea-waves/xdpyinfo sh -c 'xdpyinfo'; }


echo "[gea-waves] Set envvars for X11"

XSOCK="//tmp/.X11-unix"
XAUTH="//tmp/.docker.xauth"
if [ -z "$DOCKER_DISPLAY" ]; then
  echo "[gea-waves | Factory] <DOCKER_DISPLAY> not set!"
  exit 1
fi
if [ `command -v xauth` ]; then
  xauth nlist "$DISPLAY" | sed -e 's/^..../ffff/' | xauth -f "$XAUTH" nmerge -
fi

GUIAPP="-v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -e DISPLAY=$DOCKER_DISPLAY"

if [ -z "$SKIP_DISP" ]; then
  if [ -z $(docker images -q gea-waves/xdpyinfo 2> /dev/null) ]; then
    echo "[gea-waves] Build gea-waves/xdpyinfo from alpine:latest"
    docker pull alpine:latest
    docker run --name xdpyinfo -t alpine:latest sh -c 'sed -i -e ''s/v[0-9]\.[0-9]/edge/g'' /etc/apk/repositories && apk add -U --no-cache xdpyinfo rsync dos2unix'
    docker commit xdpyinfo gea-waves/xdpyinfo
    rm_c xdpyinfo
  fi

  echo "[gea-waves] Test gea-waves/xdpyinfo"
  xdpyinfo_resp=$(test_xdpyinfo)
  if [ -z "$(echo \"$xdpyinfo_resp\" | grep 'unable')" ]; then
    echo "OK"
  else
    echo "$xdpyinfo_resp"
    echo "Can't connect to X server on $DOCKER_DISPLAY."
    if [ "$(uname | cut -c1-5)" = "MINGW" ]; then
      read -r -p "This is a MINGW env. If on Windows, do you want to init XMING? [y/n] " doxming
      case "$doxming" in
        [yY][eE][sS]|[yY])
          if [ -z "$XMING_PATH" ]; then
            echo "[gea-waves | Factory] <XMING_PATH> not set!"
            exit 1
          else
            eval "$XMING_PATH -ac -multiwindow -clipboard" 1> xming_log.log 2>&1 &
                test_xdpyinfo
          fi
      ;;
      esac
    fi
  fi
fi

  case $1 in
	salome)
	  docker run --rm -tv /$(pwd):/mirepo $GUIAPP l001/salome;; 
	  #trophime/salome-8.3.0:nvidia
	  #trophime/salome-8.3.0:intelhd
	of5-paraview54)
	  winpty docker run --rm -itv /$(pwd):/mirepo $GUIAPP openfoam/openfoam5-paraview54 bash;;
	cfmesh-of41)
	  winpty docker run --rm -itv /$(pwd)://mirepo $GUIAPP l001/of4-paraview5-cfmesh-py bash;;
	blender)
	  docker run --rm -tv /$(pwd):/mirepo $GUIAPP peterlauri/blender-python:latest blender;;
	* ) echo "Case <$1> is not supported by this script";;
  esac
