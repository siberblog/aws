#!/bin/bash
#update os
#yum update -y
#install apache server
yum install -y httpd
# get private ip address of ec2 instance using instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& PRIVATE_IP=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4`
# get public ip address of ec2 instance using instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& PUBLIC_IP=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4` 
# get date and time of server
DATE_TIME=`date`
# set all permissions
chmod -R 777 /var/www/html
cd /var/www/html
wget https://raw.githubusercontent.com/awsdevopsteam/ngniex/master/ryu.jpg
# create a custom index.html file
echo "<html>
<head>
    <title> Congratulations! You have created an instance from Launch Template</title>
</head>
<body>
    <h1>This web server is launched from launch template by AWSDevOps Team</h1>
    <p>This instance is created at <b>$DATE_TIME</b></p>
    <p>Private IP address of this instance is <b>$PRIVATE_IP</b></p>
    <p>Public IP address of this instance is <b>$PUBLIC_IP</b></p>
    <p><img src="ryu.jpg" alt="Oz Hakiki Cikolata Deryasi"</b></p>
</body>
</html>" > /var/www/html/index.html
# start apache server
systemctl start httpd
systemctl enable httpd