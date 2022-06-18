#!/bin/bash

read -p "Username: " username
read -p "Real Name: " name

sudo useradd -m -c "Test User Account" -d /home/$name $username
if [[ $? -eq 0 ]] ;then
        echo "Account is succesfully created"
        sudo passwd -e $username
        if [[ $? -eq 0 ]] ;then
        echo "$username, password and host  /home/$name are ready to use."
        sleep 3
        fi

fi
