#!/usr/bin/env bash

rm -r ./public
hugo --minify --gc || { exit 1; }
sudo rm -r /var/www/personal-blog
sudo cp -ar ./public/ /var/www/personal-blog
# sudo systemctl restart nginx