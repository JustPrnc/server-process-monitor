#!/bin/bash

file=$(ls | grep report | sort | tail -n 1)

# Stampa last report	
echo "Last report $file"

# Creo array di users per stampa
i=0
for u in `cat /etc/passwd | cut -d: -f1`; do
	users[i]=$u
	let "i++"
done

echo

# for per l'echo del numero processi
i=0
for user in ${users[@]}; do
	echo "$user: `cat $file | grep $user | wc -l`"
	let "i++"
done

echo

read -p "Inserire utente: " user

for report in `ls | grep report`; do
	echo "report: $report; processi `cat $report | grep $user | wc -l`" 
done
