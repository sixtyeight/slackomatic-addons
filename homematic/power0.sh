#!/bin/bash

VALUE=$1

wget -T 2 -O - "http://10.20.30.91/config/xmlapi/statechange.cgi?ise_id=1472&new_value=${VALUE}" > /dev/null 2>&1
