#!/bin/bash

total=`du -b *.csv -c | cut -f1 | tail -n1`

if (( $total >= 50000 ));then
	sum=$total
	i=0
	
	for size in `du -b *.csv | cut -f1`; do
		if (( $sum <= 50000 )); then
			break
		fi

		let "sum-=$size"
		let "i++"
	done
	
	echo
	echo "Elimino i seguenti file: "
	echo `ls *.csv | head -n$i`
	echo
	rm `ls *.csv | head -n$i`
else	
	echo
	echo "Nessun file da cancellare, la somma dello spazio occupato non supera i 50kB"
	echo
fi
	
