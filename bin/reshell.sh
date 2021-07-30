while true; do
	OUTPUT=$(wget -q  -O /tmp/foo no-web.ddns.net | grep '200' /tmp/foo | wc -l)
	if [ $OUTPUT -gt 0 ]; then
		echo "Website is up"
		ssh -R 42069:localhost:22 senaex@192.168.178.14
	else
		echo "Website is down"
	fi
	echo "$OUTPUT"
	sleep 5
done
