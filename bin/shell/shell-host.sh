while true; do
	OUTPUT=$(wget -q --spider --server-response noftp.ddns.net 2>&1 | grep '200\ OK' | wc -l )
	if [ $OUTPUT -gt 0 ]; then
		echo "Website is up"
      sshpass -p "0918" ssh -R 42069:localhost:22 senaex@noftp.ddns.net sleep 10
	else
		echo "Website is down"
	fi
	sleep 3
done
