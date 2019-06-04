## LAMP Stack with Vagrant

#### Emulating "Homestead"

    - LAMP Stack + Laravel 5.x setup
    - LAMP stands for: Linux, Apache2, MySQL and PHP

#### [Updating Repo]

  `sudo apt-get update`

####[Installing Apache2 + PHP]

  `sudo apt-get install apache2 php php-mbstring php-zip phpunit unzip libapache2-mod-php`

#### [root user/password mysql]

  `sudo apt-get install mysql-server` (with the TUI for root password)

  `sudo service mysql start`

  `mysql -u root -p [prompting password]`


#### Create a DATABASE and a user

  `CREATE DATABASE laravel_project;`

  `CREATE USER 'laravel_user'@'localhost' IDENTIFIED BY 's3curepasswd';`

  `GRANT ALL PRIVILEGES ON laravel_project.* TO 'laravel_user'@'localhost';`

  `FLUSH PRIVILEGES;`


#### [Laravel 5 installation + Composer]

  `curl -Ss https://getcomposer.org/installer | php`

  `sudo mv composer.phar /usr/bin/composer`

  `sudo chown -R vagrant:vagrant /var/www` (changing the permission ownership to the user vagrant)

  `composer create-project --prefer-dist laravel/laravel laraproject` (on the /var/www/ directory)


#### [Laravel Permission Setup]

  `chmod -R 777 storage/`

#### [Apache2 config for serving files]

  `sudo vim /etc/apache2/sites-available/000-default.conf`

  Change DocumentRoot to `/var/www/laraproject/public`

  `sudo apachectl restart`

#### [Changing .env credentials for Database]

  `vim .env`
