#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

sudo apt-get install nginx -y

sudo cp /home/ubuntu/config_files/nginx.conf /etc/nginx/

# finally, restart the nginx service so the new config takes hold
sudo service nginx restart

cd /home/ubuntu/app

echo "export DB_HOST=192.168.10.150" >> ~/.bashrc

source ~/.bashrc

npm install

pm2 start app.js --update-env