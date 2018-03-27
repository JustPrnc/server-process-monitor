#!/bin/bash

# Variabili per controllo file più recente (manca il modo per scorrere il file, pensavo ad array di String con filePaths)
current=`date +"%s"`
last_modified=`stat -s $file | cut -d " " -f9`

# Stampa last report
if [ `$current - $last_modified` -gt 5 ]
then
	#
	echo "Last report: $file"
fi

# Creo array di users per stampa
i=0
for user in `cut -d: -f1 /etc/passwd`; do
	users[i]=$user
	let "i++"
done

# Mi ricavo la colonna users dal file più recente per il conteggio
#user_column=`cut -d: -f1 $file`

# for per l'echo del numero processi
i=0
for user in `cut -d: -f1 $file`; do
	echo "$(users[i]): `grep $users | wc -l`"
done

# grep "Parola da cercare" | wc -l
