#!bin/bash
awk -F"[" '/serdar/&&/TerminateInstance/ {print $2}' event_history.csv | \
awk -F"]" '{print $1}' > test1
for ((i=1; i<7; i++))
do 
cut -d',' -f$i test1 |cut -d',' -f2 |cut -d':' -f2 |cut -b 3-21 >> test2
done
echo "Instances' ids terminated by Serdar" >result1.txt
echo "***********************************" >>result1.txt
sort -r test2|uniq -c|head -17 >>result1.txt
rm test1 test2

#cat event_history.csv | grep -i serdar | grep -i TerminateInstance | grep -Eo "i-[a-zA-Z0-9]{17}" | sort | uniq