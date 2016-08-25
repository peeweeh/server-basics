# SSH IAM Manager
Allows creation and provisioning of users in EC2 Linux Instances based on SSH keys stored in IAM. Keys are not saved in the instances

Based on: https://cloudonaut.io/manage-aws-ec2-ssh-access-with-iam/

## How it Works
- Creates an import script to sync users with SSH keys in IAM every 10 minutes
- Everytime a user attempts login, the Script makes an AWS CLI Call to retrieve public key, if there is a match, user is allowed to login

## Caveats
- All users added have SUDO access

## Requirements
- Git
- Server must have latest AWS CLI

## How to Install
#### Create a User in IAM, and upload the SSH Key
### Create this Policy and attach to the IAM Role
`{ "Version": "2012-10-17", "Statement": [ { "Effect": "Allow", "Action": [ "iam:ListUsers" ], "Resource": [ "" ] }, { "Effect": "Allow", "Action": [ "iam:ListSSHPublicKeys", "iam:GetSSHPublicKey" ], "Resource": [ "" ] } ] }`

### Download and install Server Basics
`git clone https://github.com/peeweeh/server-basics.git /var/server-basics`

### Run the Setup
`sh /var/server-basics/amazon/ec2/ssh/setup.sh`

## Future
- Add Support for Windows
- Add Support for IAM Groups

