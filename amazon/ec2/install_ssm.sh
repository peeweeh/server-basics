#!/bin/bash
cd /tmp
curl https://amazon-ssm-ap-southeast-1.s3.amazonaws.com/latest/linux_amd64/amazon-ssm-agent.rpm -o amazon-ssm-agent.rpm
yum install -y amazon-ssm-agent.rpm