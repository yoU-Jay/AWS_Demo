#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
echo 'Hello World' | sudo tee /var/www/html/index.html
sudo service nginx start