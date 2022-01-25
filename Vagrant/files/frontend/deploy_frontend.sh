#!/usr/bin/bash

# Set up varaibles
SETUP_FOLDER=/home/vagrant/frontend
FRONT_END=frontend
TEMP_FOLDER=/home/vagrant/files/frontend
NGINX_SITE=/etc/nginx/sites-available/

# Install nginx server
sudo apt update -y
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Clone the frontend repo
git clone https://github.com/bezkoder/react-crud-web-api.git $SETUP_FOLDER

# Config frontend src
sudo cp $TEMP_FOLDER/http-common.js $SETUP_FOLDER/src/



# Install dependencies and build the webapp
npm install --prefix $SETUP_FOLDER
npm run-script build --prefix $SETUP_FOLDER

# Config homepage for Nginx
sudo cp $TEMP_FOLDER/default $NGINX_SITE
sudo systemctl restart nginx.service
