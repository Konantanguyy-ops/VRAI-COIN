#!/bin/bash
for URL in "$@"; do
echo "Verification de : $URL"
echo "--------------------------------"
curl -s -I "$URL" | head -n 1
if echo "$URL" | grep -q "https://"; then
echo "OK : Le site utilise HTTPS (securise)"
else
echo "ATTENTION : Le site nutilise PAS HTTPS"
fi
if echo "$URL" | grep -qi "gratuit\|free\|login\|verify\|cadeau\|gift\|account"; then
echo "DANGER : site suspect, mot de pirate detecte !"
else
echo "Nom du site : OK"
fi
echo ""
done
