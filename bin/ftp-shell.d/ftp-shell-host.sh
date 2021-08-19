while true; do
    sshpass -p "4tnaTvBN-2021" sftp -P 35878 reshell@surfactant.ddns.net:/home/reshell/ftp-shell/connections /home/senaex/bin/ftp-shell.d > /dev/null 2>&1 
    echo $(cat /home/senaex/bin/ftp-shell.d/connections)
	sleep 3
done
