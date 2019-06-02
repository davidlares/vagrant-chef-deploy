CREATE DATABASE laravel_project;
CREATE USER 'laravel_user'@'localhost' IDENTIFIED BY 's3curepasswd';
GRANT ALL PRIVILEGES ON laravel_project.* TO 'laravel_user'@'localhost';
FLUSH PRIVILEGES;
