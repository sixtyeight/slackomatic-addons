#!/bin/bash

DELAY_IN_SECONDS=$1
POWERDOWN_CALLBACK_URI=$2

# post the power down warning to the screeninvader
wget -O /dev/null "http://10.20.30.40/cgi-bin/show?http://10.20.30.90/power_down_warning.png" > /dev/null 2>&1

echo "powering down devices at '${POWERDOWN_CALLBACK_URI}' in ${DELAY_IN_SECONDS} seconds"
sleep ${DELAY_IN_SECONDS}

echo "invoking callback '${POWERDOWN_CALLBACK_URI}'"
wget -O /dev/null "${POWERDOWN_CALLBACK_URI}" > /dev/null 2>&1
