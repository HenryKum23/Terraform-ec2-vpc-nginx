#!/bin/bash
mkdir /var/www/html/index.html
sudo apt update -y &&
sudo apt install -y nginx
systemctl enable nginx
systemctl start nginx
echo " Welcome to Nging on HenryKum23 github page " >> /var/www/html/index.html