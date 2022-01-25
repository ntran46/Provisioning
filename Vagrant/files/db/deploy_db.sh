#!/usr/bin/bash

# Set up varaibles
TEMP_FOLDER=/home/vagrant/files/db

# Install MySQL
sudo apt update -y
sudo apt install -y mysql-server
sudo mysql -u root < $TEMP_FOLDER/db_init.sql

# Enable services
sudo systemctl enable mysql.service
sudo systemctl restart mysql.service