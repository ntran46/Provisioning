ALTER USER 'root'@'localhost' IDENTIFIED BY 'Password';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS backend;
CREATE USER IF NOT EXISTS 'backend'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON backend.* TO 'backend'@'%';
FLUSH PRIVILEGES;