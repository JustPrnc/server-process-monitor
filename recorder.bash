#!/bin/bash

# Nome file .csv
filename="report_`date "+%Y%m%d"`_`date "+%H%M%S"`.csv"

# Funzione per creazione array utenti
#getUsers(){
	i=0
	for user in `ps -eo user,pid,comm,start,time h | tr -s " " | cut -d " " -f 1`; do
		userlist[i]=$user
		let "i++"
	done
	#return
#}

# Funzione per creazione array processi
#getProcess(){
	i=0
	for proc in `ps -eo user,pid,comm,start,time h | tr -s " " | cut -d " " -f 2`; do
		proclist[i]=$proc
		let "i++"
	done
	#ret4n
#}

# Funzione per creazione array comandi
#getCommand(){
	i=0
	for comm in `ps -eo user,pid,comm,start,time h | tr -s " " | cut -d " " -f 3`; do
		commlist[i]=$comm
		let "i++"
	done
	#return
#}

# Funzione per creazione array strating_time
#getStart(){
	i=0
	for star in `ps -eo user,pid,comm,start,time h | tr -s " " | cut -d " " -f 4`; do
		starlist[i]=$star
		let "i++"
	done
	#return
#}

# Funzione per creazione array time
#getTime(){
	i=0
	for time in `ps -eo user,pid,comm,start,time h | tr -s " " | cut -d " " -f 5`; do
		timelist[i]=$time
		let "i++"
	done
	#return
#}

# Creazione file
touch $filename

# Riempimento file
for ((i=0; i<=${#userlist[@]}; i++)); do
	echo "${userlist[i]};${proclist[i]};${commlist[i]};${starlist[i]};${timelist[i]}" >> $filename
done


sleep 2 && `./recorder.bash` &
