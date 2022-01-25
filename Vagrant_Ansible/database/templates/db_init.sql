ALTER USER 'root'@'localhost' IDENTIFIED BY '{{ mysql_password }}';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;

CREATE USER IF NOT EXISTS '{{ backend_db_user }}';
ALTER USER '{{ backend_db_user }}'@'%' IDENTIFIED BY '{{ backend_db_password }}';
CREATE DATABASE IF NOT EXISTS {{ backend_db_name }};
GRANT ALL PRIVILEGES ON {{ backend_db_name }}.* TO '{{ backend_db_user }}'@'%';
FLUSH PRIVILEGES;
