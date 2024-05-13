#!/bin/bash

# Update package lists
sudo yum update -y

# Install EPEL repository for nginx
sudo yum install -y epel-release

# Install Nginx
sudo yum install -y nginx

# Remove the default Nginx configuration
sudo rm /etc/nginx/conf.d/default.conf

# Write a new default configuration with our HTML file
echo "
server {
    listen 80;
    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
" | sudo tee /etc/nginx/conf.d/default.conf

# Copy the HTML file to the web directory
sudo cp /home/bob/simple_app_deployment/ShellScript_Deployment/myapp.html /usr/share/nginx/html/index.html

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx service to start on boot
sudo systemctl enable nginx

