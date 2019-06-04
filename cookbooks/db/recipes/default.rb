# chef DB Layer

# setting up the SQL credentials -> PASSWORD SHOULD NOT BE PLACED HERE -> OK FOR DEMO ONLY
execute "sudo echo 'mysql-server mysql-server/root_password password admin' | debconf-set-selections"
execute "sudo echo 'mysql-server mysql-server/root_password_again password admin' | debconf-set-selections"
# installing mysql
package 'mysql-server'
# starting server
service 'mysql' do
    supports :status => true, :restart => true, :reload => true # things that support
    action [:enable, :start] # actions right now
end
# Database setup
execute "mysql -u root -padmin < /vagrant/scripts/createUser.sql"
