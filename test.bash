#!/bin/bash
userlist=`ps aux | tr -s " " | cut -d " " -f 2`
processlist=`ps aux | tr -s " " | cut -d " " -f 3`
commlist=`ps aux | tr -s " " | cut -d " " -f 11`
starlist=`ps aux | tr -s " " | cut -d " " -f 9`
timelist=`ps aux | tr -s " " | cut -d " " -f 10`

for user in $userlist; do
	for pid in $processlist; do
		for comm in $commlist; do
			for star in $starlist; do
		done
	done
done


#echo "$PID"
#echo "$string" 
#echo "$cutstringew"
