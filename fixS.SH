#!/bin/bash

## How to set this up
## make an alias to use this
## alias fixssh=~/scripts/Tools/fixS.SH
##
## author shogun8

## get ip address and set regex to validate ip
ipAddress=$1
rx='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'

## working function
removeOffendingLine(){
   if [[ $ipAddress =~ ^$rx\.$rx\.$rx\.$rx$ ]]; then
       echo "removing $ipAddress from known-hosts and regenerating the file" 
       ssh-keygen -f "/home/octavius/.ssh/known_hosts" -R $ipAddress
   elif [ -n "$ipAddress" ]; then
       echo "$ipAddress is an invalid ip address"
   else 
       echo "type the IP address after the command name; i.e.,"
       echo "fixS.SH 192.168.1.1 "
   fi
}

removeOffendingLine

exit 0
