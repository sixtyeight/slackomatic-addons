#!/bin/bash

echo "killing all running killswitches"
killall killswitch.sh

# close the browser, whatever it is showing

wget -O /dev/null "http://10.20.30.40/#/controll/browserClose" > /dev/null 2>&1

exit 0 
