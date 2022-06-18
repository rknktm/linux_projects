#!/bin/bash

yum update -y
if [[ $? == 0 ]]
then
echo "You are root privilage "
sleep 2
    #create backupfolder
    mkdir backupfolder
    #create backup files
    tar -cvf /home/ec2-user/backupfolder/data_backup.tgz /home/ec2-user/test1
    tar -cvf /home/ec2-user/backupfolder/boot_backup.tgz /boot
    tar -cvf /home/ec2-user/backupfolder/etc_backup.tgz /etc
    tar -cvf /home/ec2-user/backupfolder/usr_backup.tgz /usr
    if [[ -e /home/ec2-user/backupfolder/data_backup.tgz  && -e /home/ec2-user/backupfolder/boot_backup.tar && -e /home/ec2-user/backupfolder/etc_backup.tar && /home/ec2-user/backupfolder/usr_backup.tar  ]]
    then
      echo "Your backup files are succesfully created "
      sleep 2
    fi
    ls -lsh /home/ec2-user/backupfolder

else
echo "You are not root privilage.To continue change your usermod."
fi



# Print start status message.

# Backup the files using tar.

# Print end status message.


# Long listing of files in $dest to check file sizes.