Bash
====

My collection of bash scripts that I use to make common tasks in the shell a littl easier

### fixS.SH
This porgram is an easy way to delete old IP addresses and cruft from the known_hosts file after a failed connection due to a mac addres change
This progam can be used either with an IP addrress as an argument or without any argumants in which case in will check your current shells history for the last IP addressed you used to try to connect the IP 
usage:
fixS.SH 8.8.8.8
or
fixS.sh
