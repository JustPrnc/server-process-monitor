#!/bin/bash

cat<< END

Monitoraggio server. Comandi disponibili:

1) Inizia monitoraggio

2) Ferma monitoraggio

3) Stampa info utilizzo

4) Chiudi

END

read -p "Inserisci numero comando [1-4]: " cmd

case $cmd in

1)
	string=`top | cut -d: -f12`
	if [ $string == "bash" ] 
	then
		echo "Monitoraggio già in corso"
	else
		`bash recorder.bash` 
	fi
	;;
2)
	string=`top | cut -d: -f12`
	if [ $string == "recorder.bash" ]
	then
		killall recorder.bash
	else
		echo "Monitoraggio non iniziato"
	fi
	;;
3)
	`bash query.bash`;;
4)
	exit;;	

*)
	echo "Comando non valido";;

esac
