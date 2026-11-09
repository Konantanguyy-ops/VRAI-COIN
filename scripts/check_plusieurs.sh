#!/bin/bash

# check_plusieurs.sh - Verifie plusieurs sites dun coup
if [ $# -eq 0 ]; then
 echo "Utilisation: ./check_plusieurs.sh https://google.com http://example.com"
 exit 1
fi

for URL in "$@"; do
 echo "Verification de : $URL"
 echo "---------------------------"
 if [[ $URL == https://* ]]; then
 echo "OK : Le site utilise HTTPS (securise)"
 else
 echo "ATTENTION : Le site nutilise PAS HTTPS (non securise)"
 fi
 curl -I -s "$URL" | head -n 1
 echo ""
done
