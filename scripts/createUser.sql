CREATE DATABASE laravel_project;
-- we dont need to use "localhost" for splitted elements (connection outside localhost)
CREATE USER 'laravel_user'@'%' IDENTIFIED BY 's3curepasswd';
GRANT ALL PRIVILEGES ON laravel_project.* TO 'laravel_user'@'%';
FLUSH PRIVILEGES;
