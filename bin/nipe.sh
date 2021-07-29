#!/bin/sh
echo "Configurating full internet encryption over tor"
echo "Options:"
echo "	start"
echo "	stop"
echo "	status"
echo "	restart"


cd /home/senaex/bin/nipe
while true; do
	read x
	if [ $x = "start" ]; then
		sudo perl nipe.pl start
		sudo perl nipe.pl status
		break
	elif [ $x = "stop" ]; then
		sudo perl nipe.pl stop
		sudo perl nipe.pl status
		break
	elif [ $x = "status" ]; then
		sudo perl nipe.pl status
		break
	elif [ $x = "restart" ]; then
			sudo perl nipe.pl stop
			sudo perl nipe.pl start
			sudo perl nipe.pl status
			break
	else
		echo "Try again"
	fi
done

