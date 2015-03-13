#!/bin/bash

DELAY_IN_SECONDS=$1
POWERDOWN_CALLBACK_URI=$2

PLAYLIST=`wget -qO- "http://10.20.30.40/cgi-bin/playlist_last"`
if ! [[ "$PLAYLIST" =~ ^[0-9]+$ ]]; then PLAYLIST=0; fi
CURTIME=`date +%s`
DIFF=$(($CURTIME-$PLAYLIST))
if [ $DIFF -gt 1800 ]
then
  # post the power down warning to the screeninvader
  wget -O /dev/null "http://10.20.30.40/cgi-bin/show?http://10.20.30.90/power_down_warning.png" > /dev/null 2>&1

#  /home/pi/slackomatic-addons/homematic/power0.sh 1 

  echo "powering down devices at '${POWERDOWN_CALLBACK_URI}' in ${DELAY_IN_SECONDS} seconds"
  sleep ${DELAY_IN_SECONDS}
  
#  /home/pi/slackomatic-addons/homematic/power0.sh 0 

  echo "invoking callback '${POWERDOWN_CALLBACK_URI}'"
  wget -O /dev/null "${POWERDOWN_CALLBACK_URI}" > /dev/null 2>&1
fi

