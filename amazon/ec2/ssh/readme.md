# SSH IAM Manager
Allows creation and provisioning of users in EC2 Linux Instances based on SSH keys stored in IAM. Keys are not saved in the instances
Based on: https://cloudonaut.io/manage-aws-ec2-ssh-access-with-iam/

## Requirements
- Git on Server
- Server must have latest AWS CLI

### Create User and IAM, and upload the SSH Key
### Create this Policy and attach to the IAM Role
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:ListUsers"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:ListSSHPublicKeys",
                "iam:GetSSHPublicKey"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}

### Download and install Server Basics
`git clone https://github.com/peeweeh/server-basics.git /var/server-basics`

### Run the Setup
`sh /var/server-basics/amazon/ec2/ssh/setup.sh`

