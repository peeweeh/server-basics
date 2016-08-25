#!/bin/sh
echo "********* Add User Script ********"
source /var/server-basics/get_aws_info.sh

if [ $(id -u) -eq 0 ]; then

	if [[ -z "$1" ]]; then
		read -p "Enter username : " USERNAME
	fi

	if [[ -z "$2" ]]; then
		read -p "Enter bucket : " BUCKET
	fi
	USERNAME=$1
	BUCKET=$2

	if [[ -z "$USERNAME" ]]; then
		echo "No User"
		exit 1
	fi

	if [[ -z "$BUCKET" ]]; then
		BUCKET="s3://$VPC/config/sudoers"
	fi
	echo "Adding $USERNAME from $BUCKET"

	ret=false
	getent passwd $USERNAME >/dev/null 2>&1 && ret=true

	if $ret; then
		echo "User Already Exists"
	else
		useradd $USERNAME
		mkdir /home/$USERNAME/.ssh

		aws s3 cp $BUCKET/$USERNAME /home/$USERNAME/.ssh/authorized_keys 
		chown -R $USERNAME:$USERNAME /home/$USERNAME
		chmod 700 /home/$USERNAME/.ssh
		chmod 600 /home/$USERNAME/.ssh/authorized_keys
		chsh -s /bin/bash $USERNAME
		echo "$USERNAME ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
		chmod 0440 /etc/sudoers
	fi

else
	echo "Only root may add a user to the system"
	exit 2
fi
