#!/bin/bash


#userlist=`ps aux | tr -s " " | cut -d " " -f 1`
#proclist=`ps aux | tr -s " " | cut -d " " -f 2`
#commlist=`ps aux | tr -s " " | cut -d " " -f 11`
#starlist=`ps aux | tr -s " " | cut -d " " -f 9`
#timelist=`ps aux | tr -s " " | cut -d " " -f 10`

i=0
for user in `ps aux | tr -s " " | cut -d " " -f 1`; do 
	userlist[i]=$user
	let "i++"
done

i=0
for proc in `ps aux | tr -s " " | cut -d " " -f 2`; do 
	proclist[i]=$proc
	let "i++"
done

i=0
for comm in `ps aux | tr -s " " | cut -d " " -f 11`; do 
	commlist[i]=$comm
	let "i++"
done

i=0
for star in `ps aux | tr -s " " | cut -d " " -f 9`; do 
	starlist[i]=$star
	let "i++"
done

i=0
for time in `ps aux | tr -s " " | cut -d " " -f 10`; do 
	timelist[i]=$time
	let "i++"
done


for ((i=0; i<=${#userlist[@]}; i++)); do
	echo "${userlist[i]};${proclist[i]};${commlist[i]};${starlist[i]};${timelist[i]}"	
done

	
#echo "$userlist;$proclist;$commlist;$starlist;$timelist"

