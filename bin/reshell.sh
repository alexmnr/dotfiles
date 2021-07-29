OUTPUT=$(/usr/bin/wget "no-web.ddns.net" --timeout 30) 
#if echo "$OUTPUT" | grep -q "200 OK"; then
#  echo "online"
#elif echo "$OUTPUT" | grep -q "Connection refused"; then
#  echo "offline"
#else
#  echo "WTF"
#fi
