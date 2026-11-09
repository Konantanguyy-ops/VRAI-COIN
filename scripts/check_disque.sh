#!/bin/bash
echo "=== Verification disque VRAI-COIN ==="
df -h
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
echo "Ton disque est rempli a $USAGE %"
if [ $USAGE -gt 80 ]; then
echo "DANGER : Disque presque plein ! Fais une sauvegarde !"
else
echo "OK : Il reste de la place, tranquille."
fi
