#!/bin/sh
echo "Configurating SSH-Server"
echo "Options:"
echo "	start"
echo "	stop"
echo "	status"

while true; do
	read x
	if [ $x = "start" ]; then
		sudo systemctl start ssh.service
		sudo systemctl status ssh.service
		break
	elif [ $x = "stop" ]; then
      sudo systemctl stop ssh.service
		sudo systemctl status ssh.service
		break
	elif [ $x = "status" ]; then
		sudo systemctl status ssh.service
		break
  	else
		echo "Try again"
	fi
done

