#!/bin/bash
IFS=$'\n'
echo "Please enter the file path to the text file containing the IPs you wish to check. NOTE: These must be separated 1 per line."
sleep 1

#prompt user for location of file containing IPs (one IP per line)

read input
#reads file line by line avoiding whitespace errors with IFS
while IFS= read -r line
do

#passes each line of the file into find command searching. Edit find path accordingly.

	        i=$(find /var/log/remote/ -name $line*)
		        echo "$i"
		done <"$input"

#this part ^^ is passing the users file into the bash while loop, there are multiple ways to do this.

unset IFS
vbyrnes@IDS2a:/home/vbyrnes/scripts$ cat proxyjump.sh
#!/bin/bash

#Author: Vincent Byrnes
#Purpose: To make getting files from a sensor onto a local machine quicker in the sense of not having to remember the command/refer to it and type it out

if (( $# < 1 )); then
	echo "Syntax: proxyjump.sh sensorname"
	exit 1
fi
	

var=$1
read -p "Enter username for sensor: " username
sftp -o 'ProxyJump $USER@ids2a.qsecure.net' $username@$var
