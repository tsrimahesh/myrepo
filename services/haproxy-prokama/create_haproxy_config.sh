#!/bin/bash

# This scripts is used to create haproxy config file

echo -n "Stopping haproxy: "
  
if test -z "$1"; then
    pidFile="/var/run/haproxy.pid"
else
    pidFile="$1"
fi
  
kill `cat ${pidFile}`
  
RETVAL=$?
echo
[ $RETVAL -eq 0 ] && rm -f ${pidFile}
echo "haproxy stopped."
