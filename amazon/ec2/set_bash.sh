#!/bin/bash
echo "======= SETTINGS Bash"
echo "if [ -f /var/development-operations/general/bash ]; then" >> /etc/profile
echo " . /var/development-operations/general/bash" >> /etc/profile
echo "fi" >> /etc/profile
echo "if [ -f /var/development-operations/general/bash ]; then" >> /root/.bashrc
echo " . /var/development-operations/general/bash" >> /root/.bashrc
echo "fi" >> /root/.bashrc