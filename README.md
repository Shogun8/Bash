Bash
====

My collection of bash scripts that I use to make common tasks in the shell a little easier

----------------
### regenS.SH
This porgram is an easy way to delete old IP addresses and cruft from the known_hosts file after a failed connection (probably due due to a mac address change, or an IP address change). This progam can be used either with an IP addrress as an argument or without any argumants at all, in which case it will check your current shell's history for the IP addressed used in the most recent command, and remove that address frot he known_hosts file.   

To configure this for easy usage, just make an alias that points to this file
```bash
alias regenssh=~/ShellScripts/regenS.SH
```
Then to use this script, call it with or without an IP address as an argument 
```bash
regenssh 8.8.8.8
```
or simply
```bash
regenssh
```
----------------
