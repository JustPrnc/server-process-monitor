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
	for process in `ps -e | tr -s " " | cut -d " " -f 5`; do
		if [ $process == "/bin/bash ./recorder.bash" ] 
		then
			echo "Monitoraggio già in corso"
			break
		fi
	done
	
	`./recorder.bash` &
	;;
2)	
	control=0
	for process in `ps -e | tr -s " " | cut -d " " -f 5`; do
		if [ $process == "/bin/bash ./recorder.bash" ]
		then
			`killall recorder.bash`
			control=1
			break
		fi
	done

	if [ $control == 0 ]; then
		echo "Monitoraggio non in corso"
	fi
	;;
3)
	`bash query.bash` &
	;;
4)
	exit;;	

*)
	echo "Comando non valido";;

esac
