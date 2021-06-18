Bash
====

My collection of bash scripts that I use to make common tasks in the shell a little easier

### regenS.SH
This porgram is an easy way to delete old IP addresses and cruft from the known_hosts file after a failed connection due to a mac address change. This progam can be used either with an IP addrress as an argument or without any argumants, in which case in will check your current shells history for the last IP addressed you used to try to connect the IP.   

To set this up; make an alias that points to this file
```bash
alias regenssh=~/scripts/regenS.SH
```
To use this script, call it with or without an IP address as an argument 
```bash
regenssh 8.8.8.8
```
or just
```bash
regenssh
```
