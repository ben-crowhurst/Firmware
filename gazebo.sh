#!/bin/bash

set -e

if [ -z "$1" ]
   then
      echo "PX4_HOME_ADDR required!"
      echo "e.g ./gazebo.sh 192.168.1.156"
      exit -1
fi

export PX4_HOME_LAT=-35.363263
 
export PX4_HOME_LON=149.165238
 
export PX4_HOME_ALT=0
 
export PX4_HOME_ADDR=$1

make px4_sitl_default gazebo

