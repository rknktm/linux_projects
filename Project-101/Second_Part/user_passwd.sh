#solution1

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

#solution2

#!/bin/bash

# Make sure the script is being executed with superuser privileges.

if [[ "$UID" -ne 0 ]]
then
    echo "Please run script as root"
    exit 1
fi

# Get the username (login).
read -p "username: " username

# Get the real name (contents for the description field).
read -p "Real name: " name

# Get the password.
read -sp "Password: " pass

# Create the account.
useradd -m -c "$name" -d /home/$username  $username
echo

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.

if [[ $? -ne 0 ]]
then
echo "This username is already exist."
exit 1
fi

# Set the password.
echo ${pass} | passwd --stdin ${username}

# Check to see if the passwd command succeeded.
if [[ $? -ne 0 ]]
then
echo "The password couldn't set"
exit 1
fi

# Force password change on first login.
passwd -e $username

# Display the username, password, and the host where the user was created.
echo $username
echo $name
echo $pass
