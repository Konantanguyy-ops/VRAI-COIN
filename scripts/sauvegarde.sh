#!/bin/bash
cd ~/VRAI-COIN/
echo "Sauvegarde en cours..."
DATE=$(date +%Y-%m-%d_%H-%M)
mkdir -p scripts/backup
tar --exclude='scripts/backup' -czf scripts/backup/sauvegarde_$DATE.tar.gz docs frontend backend index.html scripts
echo "Sauvegarde terminee : scripts/backup/sauvegarde_$DATE.tar.gz"
ls -lh scripts/backup/
