#S-1

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

#date +%F: full tarihi verir
#$HOME-$(date +%F) ile tar pathi dynamik olabilir.

#$HOME enviromental variable:/home/rknktm
# env,printenv or set : list all variables



#S-2

#!/bin/bash
# Check if we are root privilage or not
if [[ "$UID" -ne 0 ]]
then
    echo "Root olarak giris yap!"
    exit 1
fi
# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
backup_files="/home/ec2-user/data"
# Where do we backup to. Please crete this file before execute this script
dest="/mnt/backup"
# Create archive filename based on time
time=$(date +"%Y_%m_%d_%I_%M_%p")
hostname=$(hostname -s)
archive_file="${hostname}-${time}.tgz"
# Print start status message.
echo "We will back up ${backup_files} to ${dest}/${archive_file} "
date
echo
# Backup the files using tar.
tar czf ${dest}/${archive_file} ${backup_files}
# Print end status message.
echo
echo "Congrulations! Your Backup is ready"
date
# Long listing of files in $dest to check file sizes.
ls -lh $dest






#S-3
#!/bin/bash

# Check if we are root privilage or not
if [[ "$UID" -ne 0 ]]
then
    echo "Root olarak giris yap!"
    exit 1
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file

backup_files="/home/ec2-user/data"
# Where do we backup to. Please crete this file before execute this script

if [ -z "$(ls /mnt/backup | grep $(date +%d-%b-%Y))" ]
then
    mkdir /mnt/backup/$(date +%d-%b-%Y)
    echo "$(date +%d-%b-%Y) folder is ready!"
else
    echo "$(date +%d-%b-%Y) folder already exists!"
fi

dest="/mnt/backup/$(date +%d-%b-%Y)"

# Create archive filename based on time

time=$(date +"%Y_%m_%d_%I_%M_%p")
hostname=$(hostname -s)
archive_file="${hostname}-${time}.tgz"

# Print start status message.
echo "We will back up ${backup_files} to ${dest}/${archive_file} "
date
echo

# Backup the files using tar.

tar czf ${dest}/${archive_file} ${backup_files}

# Print end status message.
echo
echo "Congrulations! Your Backup is ready"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest



