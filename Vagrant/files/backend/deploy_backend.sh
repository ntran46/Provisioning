#!/usr/bin/bash

# Set up varaibles
SETUP_FOLDER=/home/backend/backend
USER=backend
APP_FOLDER=app
TEMP_FOLDER=/home/vagrant/files/backend


# Install Nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Create backend user and home folder
sudo useradd -m -d /home/$USER $USER

# Clone the repo to the backend folder
sudo git clone https://github.com/bezkoder/nodejs-express-sequelize-mysql.git $SETUP_FOLDER
sudo npm install $SETUP_FOLDER/

# Config Node service
sudo cp $TEMP_FOLDER/db.config.js $SETUP_FOLDER/app/config/
sudo cp $TEMP_FOLDER/backend.service /etc/systemd/system/


# Enable services
sudo systemctl daemon-reload
sudo systemctl enable backend.service 
sudo systemctl start backend.service 



