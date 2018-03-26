#!/bin/bash

#time=`date "+%H%M"`
#date=`date "+%Y%m%d"`
filename="report_`date "+%Y%m%d"`_`date "+%H%M"`.csv"

#getUsers(){
	i=0
	for user in `ps aux | tr -s " " | cut -d " " -f 1`; do 
		userlist[i]=$user
		let "i++"
	done
	#return
#}

#getProcess(){
	i=0
	for proc in `ps aux | tr -s " " | cut -d " " -f 2`; do 
		proclist[i]=$proc
		let "i++"
	done
	#ret4n
#}

#getCommand(){
	i=0
	for comm in `ps -e | tr -s " " | cut -d " " -f 5`; do 
		commlist[i]=$comm
		let "i++"
	done
	#return
#}

#getStart(){
	i=0
	for star in `ps aux | tr -s " " | cut -d " " -f 9`; do 
		starlist[i]=$star
		let "i++"
	done
	#return
#}


#getTime(){
	i=0
	for time in `ps aux | tr -s " " | cut -d " " -f 10`; do 
		timelist=`ps aux | tr -s " " | cut -d " " -f 10`
		timelist[i]=$time
		let "i++"
	done
	#return
#}


#$getUser
#$getProcess
#$getCommand
#$getStart
#$getTime

touch $filename

for ((i=0; i<=${#userlist[@]}; i++)); do
	echo "${userlist[i]};${proclist[i]};${commlist[i]};${starlist[i]};${timelist[i]}" > $filename
done

sleep 60 && `./recorder.bash` &


