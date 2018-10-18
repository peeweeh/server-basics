#!/bin/bash
echo "********* Install Code Deploy ********"
yum update
yum install -y ruby wget
cd /home/ec2-user
wget https://aws-codedeploy-ap-southeast-1.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto
service codedeploy-agent start