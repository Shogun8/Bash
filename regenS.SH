#!/bin/bash
if [ ! -n "$BASH" ] ;then echo Please run this script $0 with bash; exit 1; fi

## To use, run this command with or without an IP address as an argument 
## i.e., regenS.SH 8.8.8.8
## 
## author shogun8

## ToDo; test fqdns as the source of error in the known_hosts file  

## Get the shell that the user is working in so that history file can be read
schnell=$(echo $SHELL | awk -F'/' '{print $3}')

## set the history file based on the shell aquired
historyFile=$schnell"_history"

## Set the ip address from the one found in the following functions
ipAddress=$1

## strongly type the result variable with an empty value to make it global
result=0

## Make sure the IP address is in a valid format
function validateIP(){
    ## regex used to validate any IPv4 
    rx='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'
    if [[ $ipAddress =~ ^$rx\.$rx\.$rx\.$rx$ ]]; then 
      result=valid;
    else
      echo "invalid IP address supplied... exiting"
      exit 1 
    fi 
}

## grab the ip address from either the shell argument or the shell's history file
function grabIPfromArg(){
  ## Grab the ip address that failed from the argument input
  if [[ -n $ipAddress ]]; then 
    validateIP result
    if [[ $result == valid ]]; then
      removeOffendingLine
    fi
  else
    ## Or grab the ip address from the last command in history file
    echo noIPaddressSupplied
    getIPfromHist
    removeOffendingLine
  fi
}

## grab the ip address the shell's history file
function getIPfromHist(){
  echo "the history file we will use is " $historyFile
  ipAddress=$(tail -2 ~/.$historyFile | head -1 | sed 's/ \(.* \)/\1/g'|cut -f2 -d ' ' | sed 's/.*@//' )
}

testForATsymbol(){
  not_allowed=@ # Charater which is not allowed
  [[ "$1" =~ $not_allowed ]] && echo "@ symbol was found"
}

## use regex function to validate ip then remove that IP from the known_hosts file
removeOffendingLine(){
  validateIP result
  if [[ $result == valid ]]; then
    echo "removing $ipAddress from known-hosts and regenerating the file"
    ssh-keygen -f ~/.ssh/known_hosts -R $ipAddress
  #elif [ -n "$ipAddress" ]; then
    #echo "$ipAddress is an invalid ip address"
  else
    echo "type the IP address after the command name; i.e.,"
    echo "regenS.SH 192.168.1.1 "
  fi
}

## running the first function (grabIPfromARG) will test if an IP address was supplied as an argument
## if not, then it will chain to the function (granIPfromHist) which tests for the IP address in the 
## current shells history file, then if a valid ip address is found it will then chain to the next 
## function (removeOffendingLine) which will remove the line then regenerate the known_hosts file  
grabIPfromArg

exit 0
