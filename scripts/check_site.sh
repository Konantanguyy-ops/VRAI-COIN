#!/bin/bash
echo "je verifie si google.com est en ligne..."
ping -c 1 google.com

if [ $? -eq 0 ]; then
echo "google.com est EN LIGNE"
else
echo "google.com est HORS LIGNE"
fi
