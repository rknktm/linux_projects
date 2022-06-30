#S-1
#!bin/bash
ip=$(head -20  info.json | tail -1 | cut -b 34-46)
sed "s/ec2-private_ip/$ip/" ./terraform.tf > terraform1.tf


#S-2
#!/bin/bash
privatIP=$(sed '20!d' info.json | awk -F\" '{print $4}')
sed "s/ec2-private_ip/$privatIP/" terraform.tf > terraform_new.tf

#S-3
privatIP=$(cat info.json | grep "PrivateIpAddress" | head -1 | awk -F\" '{print $4}')
sed -i "s/ec2-private_ip/$privatIP/" terraform.tf

#S-4
IP=$(sed -n '20p' info.json |cut -b 34-46)|echo $IP| sed "s/ec2-private_ip/$IP/" terraform.tf


To Delete a particular line say n in sed command.
Syntax:
$ sed 'nd' filename.txt
Example:
$ sed '5d' filename.txt

Printing only the replaced lines : Use the -n option along with the /p print flag to display only the replaced lines.

$sed -n 's/unix/linux/p' geekfile.txt