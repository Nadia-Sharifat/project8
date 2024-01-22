#!/bin/bash
read -p "Enetr IP: " IP
read -p "Enter the username: " USERNAME

ping -c 1 $IP >> /dev/null
if [ $? -eq 0 ]
then
    sftp "$USERNAME@$IP" <<EOF
    lcd /etc/
    cd /home/$USERNAME
    put passwd
    ls
    bye
EOF
else
        echo "The server isnt accessible..."
        exit 1
        fi
