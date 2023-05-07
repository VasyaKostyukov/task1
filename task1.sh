#!/bin/bash
var="$(grep -rc 'release-backports' /etc/apt/sources.list)"
repositoryValue="deb http://archive.ubuntu.com/ubuntu release-backports main restricted universe multiverse"
if [ $var -eq 0 ]
then
echo $repositoryValue | sudo tee -a /etc/apt/sources.list
echo "The Backports repository has been successfully added to the /etc/apt/sources.list file!"
else echo "The Backports repository has already been added to the /etc/apt/sources.list file!"
fi
echo "--------------------------------------------------------------------------------------------------------------------------------------"
sudo apt update
sudo apt upgrade
echo "The package manager has been successfully updated!"
echo "--------------------------------------------------------------------------------------------------------------------------------------"
apacheValue="$(command -v apache2)"
if [ -n $apacheValue ]
then echo "Apache2 is already installed in system!"
else
sudo apt install apache2
echo "Apache2 has been successfully installed in system!"
fi
echo "Starting Apache2!"
sudo systemctl start apache2
sudo systemctl status apache2
echo "-------------------------------------------------------------------------------------------------------------------------------------"
pythonValue="$(command -v python3.10)"
if [ -n $pathonValue ]
then echo "Python3.10 is already installed in system!"
else
sudo apt install python3.10
echo "Python3.10 has been successfully installed in system!"
fi
echo "-------------------------------------------------------------------------------------------------------------------------------------"
sshValue="$(command -v ssh)"
if [ -n $sshValue ]
then echo "SSH server is already installed in system!"
else
sudo apt install openssh-server
echo "SSH server has been successfully installed in system!"
fi
echo "Starting SSH server!"
sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl status ssh
journalctl | grep -i ssh
echo "-------------------------------------------------------------------------------------------------------------------------------------"
