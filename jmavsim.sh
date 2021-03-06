#!/bin/bash

set -e

if [ -z "$1" ]
   then
      echo "PX4_HOME_ADDR required!"
      echo "e.g ./jmavsim.sh 192.168.1.156 14550 username password"
      exit -1
fi

export PX4_HOME_ADDR=$1

if [ -z "$2" ]
   then
      export PX4_GNDCTRL_PORT=14550
else
      export PX4_GNDCTRL_PORT=$2
fi

if [ -z "$3" ]
   then
      echo "PX4_USERNAME required!"
      echo "e.g ./jmavsim.sh 192.168.1.156 14550 username password"
      exit -1
fi

export PX4_USERNAME=$3

if [ -z "$4" ]
   then
      echo "PX4_PASSWORD required!"
      echo "e.g ./jmavsim.sh 192.168.1.156 14550 username password"
      exit -1
fi

export PX4_PASSWORD=$4

export PX4_HOME_LAT=-35.363263

export PX4_HOME_LON=149.165238

export PX4_HOME_ALT=0

export PX4_SERIAL=123456789

make px4_sitl_default jmavsim

