#!/usr/bin/env bash

echo "Provisioning virtual machine ..."

# Add vg hostname
cp /var/www/vagrant_bootstrap/vg.local.conf /etc/apache2/sites-available/
cd /etc/apache2/sites-enabled
ln -s /etc/apache2/sites-available/vg.local.conf .

# Add the hostname to hosts file
echo "127.0.1.1 vg.local www.vg.local" >> /etc/hosts

# Install toolchain
wget -nv -O/usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer -vv
#wget -nv -O/usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && chmod +x /usr/local/bin/phpunit -vv
#wget -nv -O/usr/local/bin/phpcpd https://phar.phpunit.de/phpcpd-2.0.4.phar && chmod +x /usr/local/bin/phpcpd -vv
wget -nv -O/usr/local/bin/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && chmod +x /usr/local/bin/phpcs -vv
wget -nv -O/usr/local/bin/phploc https://phar.phpunit.de/phploc.phar && chmod +x /usr/local/bin/phploc -vv
wget -nv -O/usr/local/bin/pdepend http://static.pdepend.org/php/latest/pdepend.phar && chmod +x /usr/local/bin/pdepend -vv
wget -nv -O/usr/local/bin/phpmd http://static.phpmd.org/php/latest/phpmd.phar && chmod +x /usr/local/bin/phpmd -vv
wget -nv -O/usr/local/bin/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && chmod +x /usr/local/bin/phpcs -vv
wget -nv -O/usr/local/bin/phpcbf https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && chmod +x /usr/local/bin/phpcbf -vv

# Update repositories
apt-get update

# PHP tools
#yes | sudo apt-get install php-xdebug php-xml php7.0-xml php-mbstring

sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.2

sudo apt-get install -y php7.2-bcmath php7.2-bz2 php7.2-cgi php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-dev php7.2-enchant php7.2-fpm php7.2-gd php7.2-gmp php7.2-imap php7.2-interbase php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-opcache php7.2-pgsql php7.2-phpdbg php7.2-pspell php7.2-readline php7.2-recode php7.2-snmp php7.2-soap php7.2-sqlite3 php7.2-sybase php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-zip php-xdebug

echo "xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.remote_autostart=1
//xdebug.remote_port=10000
//xdebug.remote_log=/tmp/xdebug-remote.log
//xdebug.idekey = PHPSTORM" >> /etc/php/7.2/mods-available/xdebug.ini

cp /var/www/vagrant_bootstrap/user.ini /etc/php/7.0/apache2/conf.d/ 

# Finally, restart apache
service apache2 restart





