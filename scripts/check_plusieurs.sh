#!/bin/bash
for site in google.com youtube.com facebook.com
do
echo "je verifie $site..."
ping -c 1 $site > /dev/null
if [ $? -eq 0 ]; then
echo "$site est EN LIGNE"
else
echo "$site est HORS LIGNE"
fi
done

