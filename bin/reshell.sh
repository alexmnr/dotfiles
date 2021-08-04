while true; do
	OUTPUT=$(wget -q  -O /tmp/foo no-web.ddns.net | grep '200' /tmp/foo | wc -l)
	if [ $OUTPUT -gt 0 ]; then
		echo "Website is up"
      sshpass -p "1234" ssh -R 42069:localhost:22 neo@no-web.ddns.net sleep 10
	else
		echo "Website is down"
	fi
	sleep 3
done
