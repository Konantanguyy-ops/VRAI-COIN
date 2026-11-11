#!/bin/bash
echo "Sauvegarde en cours..."

DATE=$(date +%Y-%m-%d_%H-%M)
mkdir -p backup

tar -czf backup/sauvegarde_$DATE.tar.gz ../docs ../README.md

echo "Sauvegarde terminee : backup/sauvegarde_$DATE.tar.gz"
ls -lh backup/
