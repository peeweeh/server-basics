#!/bin/sh
echo "********* Set Default Bash Script ********"
lockfile=/var/tmp/bashlock
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null; then
		echo "if [ -f /var/server-basics/general/bash/bash_profile ]; then" >> /etc/profile
		echo " . /var/server-basics/general/bash/bash_profile" >> /etc/profile
		echo "fi" >> /etc/profile
else
    	echo "Lock Exists: $lockfile owned by $(cat $lockfile)"
fi