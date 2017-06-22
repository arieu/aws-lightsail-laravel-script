# Initial Update
sudo apt-get update
sudo apt-get -y install php
sudo apt-get -y install apache2
# Firewall
sudo ufw allow in "Apache Full"
# MySQL setup setting root as password
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y update
sudo apt-get -y install mysql-server
# Laravel dependencies
sudo apt-get -y install libapache2-mod-php php-curl php-gd php-mysql php-mcrypt php-gettext php-mbstring php-zip
# enable mod rewrite
sudo a2enmod rewrite 
# create web app directory with link
sudo mkdir /home/ubuntu/laravelapp
sudo ln -fs /home/ubuntu/laravelapp /var/www/laravel
# report errors
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/apache2/php.ini
# allow override
sudo sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
#restart apache
sudo service apache2 restart
# Composer
sudo apt install -y composer
# node dependencies
sudo apt-get -y install vim curl build-essential python-software-properties git
#node and npm
sudo apt-get -y install nodejs-legacy
sudo apt-get -y install npm
sudo npm install -g gulp bower
#Swapfile will only be used until reboot
sudo fallocate -l 1G /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
