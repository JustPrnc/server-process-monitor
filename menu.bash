#!/bin/bash



cat<< END
Monitoraggio server. Comandi disponibili:

1) Inizia monitoraggio

2) Ferma monitoraggio

3) Stampa info utilizzo

4) Chiudi

END

while true; do

read -p "Inserisci numero comando [1-4]: " cmd

case $cmd in

1)
	for process in `ps -e | tr -s " " | cut -d " " -f5`; do
		if [ $process == "recorder.bash" ]
		then
			echo "Monitoraggio già in corso"
			break
		fi
	done
	./recorder.bash &
	;;

2)
	control=0
	for process in `ps -e | tr -s " " | cut -d " " -f5`; do
		if [ $process == "recorder.bash" ]
		then
			control=1
			`killall recorder.bash`
			break
		fi
	done

	if [ $control == 0 ]; then
		echo "Monitoraggio non iniziato"
	fi
	;;
3)
	./query.bash
	;;
4)
	exit
	;;

*)
cat<< END

Monitoraggio server. Comandi disponibili:

1) Inizia monitoraggio

2) Ferma monitoraggio

3) Stampa info utilizzo

4) Chiudi

END
	;;

esac

done
