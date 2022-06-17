#!bin/bash
awk -F"[" '/serdar/&&/TerminateInstance/ {print $2}' event_history.csv | \
awk -F"]" '{print $1}' > result.txt

