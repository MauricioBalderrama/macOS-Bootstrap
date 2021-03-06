#!/bin/bash

###############################################################################
# NGINX
###############################################################################

# Open source HTTP web server and reverse proxy server
brew install nginx 

# Auto-start server
sudo cp -v /usr/local/opt/nginx/homebrew.mxcl.nginx.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

# Change port from 8080 to 80
sed -i '' 's/listen       8080/listen       80/g' /usr/local/etc/nginx/nginx.conf

# Add servers folder
mkdir /usr/local/etc/nginx/servers

# Start server
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

# Review configuration
curl -IL http://127.0.0.1:80


###############################################################################
# Dnsmasq   map *.localhost to 127.0.0.1
###############################################################################

# Forward *.localhost to 127.0.0.1.  Domain Name System forwarder, Dynamic Host Configuration Protocol server, router advertisement and network boot features
brew install dnsmasq 

# Modify configuration to forward all *.localhost request to 127.0.0.1 
echo "
# Automatically included by macOS Bootstrap process
# Forward all *.localhost request to 127.0.0.1 
address=/.localhost/127.0.0.1" >> /usr/local/etc/dnsmasq.conf

# Start dnsmasq as a service so it automatically starts at login
sudo brew services start dnsmasq

# Create custom resolver to use dnsmasq for routing *.localhost
cd ~
sudo touch localhost
sudo echo "nameserver 127.0.0.1" > localhost
sudo mkdir /etc/resolver
sudo cp localhost /etc/resolver/localhost

###############################################################################
# PHP 5.6
###############################################################################

# Install
brew tap exolnet/homebrew-deprecated
brew install php@5.6

# Listen on port 9056
sed -i '' 's/listen = 127.0.0.1:9000/listen = 127.0.0.1:9056/g' /usr/local/etc/php/5.6/php-fpm.conf

###############################################################################
# PHP 7.4
###############################################################################

# Install
brew install php

# Listen on port 9074
sed -i '' 's/listen = 127.0.0.1:9000/listen = 127.0.0.1:9074/g' /usr/local/etc/php/7.4/php-fpm.d/www.conf

###############################################################################
# PHP (general)
###############################################################################

# Add PHP CLI binary path
echo 'export PATH="/usr/local/sbin:$PATH" # PHP bin' >> ~/.profile && . ~/.profile

# Configure auto-start on system boot
mkdir -p ~/Library/LaunchAgentscd
ln -sfv /usr/local/opt/php\@5.6/homebrew.mxcl.php\@5.6.plist ~/Library/LaunchAgents/
ln -sfv /usr/local/opt/php/homebrew.mxcl.php.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php\@5.6.plist
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php.plist

# Review configuration
lsof -Pni4 | grep LISTEN | grep php

###############################################################################
# Laravel config (Nginx)
###############################################################################

# Create server block
cp ./laravel.conf /usr/local/etc/nginx/servers/laravel

# Reload Nginx
sudo nginx -s reload

###############################################################################
# MariaDB
###############################################################################

# Install
brew install mariadb

# Configure auto-start
ln -sfv /usr/local/opt/mariadb/homebrew.mxcl.mariadb.plist ~/Library/LaunchAgents

# Launch service
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

# Secure installation
sudo mysql_secure_installation

#Verify
sudo lsof -PiTCP -sTCP:LISTEN | grep mysqld
