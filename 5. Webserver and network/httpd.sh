#!/bin/bash
yum update -y
yum -y install httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>AltaisSRE-Coding-Challenge</h1>" > /var/www/html/index.html