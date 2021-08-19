while true; do
    sshpass -p "Idkpuh-2021" sftp -P 35878 reshell@surfactant.ddns.net:/home/reshell/ftp-shell/connections /home/senaex/bin/ftp-shell.d > /dev/null 2>&1 
    while read p; do
        IP=$(echo "$p" | grep -o "I: .*" | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
        PORT=$(echo "$p" | grep -o "P: .*" | grep -Eo "[0-9]{1,5}")
        if [ -z "$IP" ]; then
            echo "No connection found"
        else
            echo "Connecting to:"
            echo $IP
            echo $PORT
            sshpass -p "Idkpuh-2021" ssh -R 42069:localhost:22 reshell@$IP -p $PORT sleep 10 &
        fi
    done </home/senaex/bin/ftp-shell.d/connections
	sleep 3
done
