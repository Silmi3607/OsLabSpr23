#!/bin/bash

echo "Please enter your username:"
read username

echo "Please enter your password:"
read -s password

sudo apt-get update
sudo apt-get install samba

sudo smbpasswd -a $username
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo sed -i "s/^\[global\]/&\n\n# Share configuration\n[shared]\n   path = \/home\/$username\/shared\n   valid users = $username\n   read only = no\n   browseable = yes\n/" /etc/samba/smb.conf
sudo service smbd restart


