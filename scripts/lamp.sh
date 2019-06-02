# updating repos
sudo apt-get update
# installing apache2 and PHP
sudo apt-get install -y apache2 php php-mbstring php-zip phpunit unzip libapache2-mod-php
# installing MYSQL
# save PASSWORD in the system
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'
sudo apt-get install -y mysql-server
sudo service mysql start
# # feeding MySQL
mysql -u root -padmin < /vagrant/scripts/createUser.sql
# # composer
curl -Ss https://getcomposer.org/installer | php
# # global user
sudo mv composer.phar /usr/bin/composer
# # changing ownership
sudo chown -R vagrant:vagrant /var/www
# # installing laravel globally
composer global require laravel/installer
# # moving to apache
cd /var/www
# # creating laravel project
composer create-project --prefer-dist laravel/laravel laraproject
# # changing storing permission
chmod -R 777 /var/www/laraproject/storage
# # changing the default point directory on Apache2 using SED (replacing chars)
sudo sed -i 's/DocumentRoot.*/DocumentRoot \/var\/www\/laraproject\/public/' /etc/apache2/sites-available/000-default.conf
# # restarting apache
sudo apachectl restart
