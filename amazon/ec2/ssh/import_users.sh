#!/bin/bash -e
aws iam list-users --query "Users[].[UserName]" --output text | while read User; do
  if id -u "$User" >/dev/null 2>&1; then
    echo "$User exists"
  else
  	aws iam list-ssh-public-keys --user-name "$User" --query "SSHPublicKeys[?Status == 'Active'].[SSHPublicKeyId]" --output text | while read KeyId; do
	  /usr/sbin/adduser "$User"
  	  echo "$User ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$User"
  	  break
	done
    
  fi
done