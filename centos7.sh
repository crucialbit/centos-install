#!/bin/sh

echo "Adding a new user"
echo "Please input the name: "
read username

adduser $username

echo "Change the password for the user: "
passwd $username

echo "Allow user to use sudo command."
gpasswd -a $username wheel

echo "Setting up firewall."
systemctl start firewall-cmd
systemctl enable firewall-cmd

echo "Allow http/https connection."
firewall-cmd --add-service=http --permanent
firewall-cmd --add-service=https --permanent

echo "Upgrading server"
yum -y update

echo "Installing Vim"
yum -y install vim

echo "Installing fish"
yum -y install fish

echo "Installing nginx"
yum -y install nginx

echo "Installing MariaDB"
cp $dirname/MariaDB.repo /etc/yum.repos.d/
yum -y install MariaDB-server MariaDB-client