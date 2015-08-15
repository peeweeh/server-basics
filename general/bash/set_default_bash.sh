#!/bin/sh
echo "********* Set Default Bash Script ********"
echo "if [ -f /var/server-basics/general/bash/bash_profile ]; then" >> /etc/profile
echo " . /var/server-basics/general/bash/bash_profile" >> /etc/profile
echo "fi" >> /etc/profile
echo "if [ -f /var/server-basics/general/bash/bash_profile ]; then" >> /root/.bashrc
echo " . /var/server-basics/general/bash/bash_profile" >> /root/.bashrc
echo "fi" >> /root/.bashrc