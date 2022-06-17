#!/bin/bash
i=1
for ((i=1; i<11; i++))
do 
sed 's/\\n/:/g' ./certificate.pem| \
cut -d":" -f$i >> new.pem
echo
done 