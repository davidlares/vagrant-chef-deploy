# chef config file
execute "sudo apt-get update"
# installing packages
['apache2', 'php', 'php-mbstring', 'php-zip', 'phpunit', 'unzip', 'libapache2-mod-php'].each do |p|
  package p do
    action install
  end
end
# installing Composer Block
execute "installComposer" do
  command "curl -Ss https://getcomposer.org/installer | php"
  user "vagrant"
  cwd "/tmp"
  environment "HOME" => '/home/vagrant' # chef way to handle users
end
# moving composer
execute "sudo mv /tmp/composer.phar /usr/bin/composer"
# installing laravel Block
execute "installLaravel" do
  command "composer gloal require laravel/installer"
  user "vagrant"
  environment "HOME" => '/home/vagrant' # chef way to handle users
end
# permisions
execute "sudo chown -R vagrant:vagrant /var/www"
# new laravel project
execute "createProject" do
  command "composer create-proejct --prefer-dist laravel/laravel laraproject"
  user "vagrant"
  environment "HOME" => "/home/vagrant"
end
# changing Apache2 .conf file
execute "sudo sed -i 's/DocumentRoot.*/DocumentRoot \\/var\\/www\\/laraproject\\/public/' /etc/apache2/sites-available/000-default.conf"
# restarting apache
service 'apache2' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :restarts]
end
