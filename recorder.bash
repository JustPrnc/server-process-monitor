#!/bin/bash

# Nome file .csv
filename="report_`date "+%Y%m%d"`_`date "+%H%M"`.csv"

# Funzione per creazione array utenti
#getUsers(){
	i=0
	for user in `ps aux | tr -s " " | cut -d " " -f 1`; do 
		userlist[i]=$user
		let "i++"
	done
	#return
#}

# Funzione per creazione array processi 
#getProcess(){
	i=0
	for proc in `ps aux | tr -s " " | cut -d " " -f 2`; do 
		proclist[i]=$proc
		let "i++"
	done
	#return
#}

# Funzione per creazione array comandi
#getCommand(){
	i=0
	for comm in `ps aux | tr -s " " | cut -d " " -f 11`; do 
		commlist[i]=$comm
		let "i++"
	done
	#return
#}

# Funzione per creazione array strating_time
#getStart(){
	i=0
	for star in `ps aux | tr -s " " | cut -d " " -f 9`; do 
		starlist[i]=$star
		let "i++"
	done
	#return
#}

# Funzione per creazione array time
#getTime(){
	i=0
	for time in `ps aux | tr -s " " | cut -d " " -f 10`; do 
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

# Creazione file 
touch $filename

# Riempimento file
for ((i=0; i<=${#userlist[@]}; i++)); do
	echo "${userlist[i]};${proclist[i]};${commlist[i]};${starlist[i]};${timelist[i]}" >> $filename
done

# Sleep e ri-esecuzione dello script (5 secondi)
sleep 5 && `bash recorder.bash`
