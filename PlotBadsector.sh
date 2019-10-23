#!/bin/bash
FILE=$1
if [ -f "$FILE" ]; then
	cat $FILE | sed 's/$/ 1/' > /tmp/plotbad.txt
	if [ -z "$2" ]; then
		gnuplot -e "set xtics rotate; set format x '%.0f'; plot '/tmp/plotbad.txt'"
	else
		gnuplot -e "set terminal jpeg; set xtics rotate; set format x '%.0f'; plot '/tmp/plotbad.txt'" > $2
	fi
	rm /tmp/plotbad.txt
else
	echo "Usage: $0 [input_badblock] (optional)[output_jpeg]"
fi
