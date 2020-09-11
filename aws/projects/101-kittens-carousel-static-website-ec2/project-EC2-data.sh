#!/bin/bash
#update os
#yum update -y

#install apache server
yum install -y httpd

# set all permissions
chmod -R 777 /var/www/html
cd /var/www/html

# 
wget https://raw.githubusercontent.com/siberblog/AWS-DevOps-Workshop/master/aws/projects/101-kittens-carousel-static-website-ec2/static-web/index.html
wget https://raw.githubusercontent.com/siberblog/AWS-DevOps-Workshop/master/aws/projects/101-kittens-carousel-static-website-ec2/static-web/cat0.jpg
wget https://raw.githubusercontent.com/siberblog/AWS-DevOps-Workshop/master/aws/projects/101-kittens-carousel-static-website-ec2/static-web/cat1.jpg
wget https://raw.githubusercontent.com/siberblog/AWS-DevOps-Workshop/master/aws/projects/101-kittens-carousel-static-website-ec2/static-web/cat2.jpg

# start apache server
systemctl start httpd
systemctl enable httpd