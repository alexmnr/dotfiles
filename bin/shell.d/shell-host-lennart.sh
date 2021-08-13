while true; do
	OUTPUT=$(wget -q --spider --server-response surfactant.ddns.net:39873 2>&1 | grep '200\ OK' | wc -l )
	if [ $OUTPUT -gt 0 ]; then
		echo "Website is up"
      sshpass -p "Kabeljau21" ssh -R 42069:localhost:22 dumbo@surfactant.ddns.net -p 35878 sleep 10
	else
		echo "Website is down"
	fi
	sleep 3
done
