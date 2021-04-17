#!/bin/bash
set -xv
echo -e "dump\ndump" | sudo passwd root >/dev/null 2>&1
sudo timedatectl set-timezone Africa/Cairo
HOSTNAME=$(hostname)
sudo hostnamectl set-hostname ${HOSTNAME}
echo -e "127.0.0.1	$HOSTNAME" | sudo tee -a /etc/hosts > /dev/null 2>&1
sudo apt-get -y update && sudo apt-get -y autoremove
