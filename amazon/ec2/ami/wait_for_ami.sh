AMISTATE=$(aws ec2 describe-images --image-ids $1 | jq -r '.Images[].State'); 

if [ -z "$AMISTATE" ] 
	then
	echo "AMI $1 Does not Exist"
	exit 1
else
	echo "Waiting for $1 to Complete: $AMISTATE"
fi


if [ "$AMISTATE" != "failed" ]; then
	while [ "$AMISTATE" != "available" ]
	do
		AMISTATE=$(aws ec2 describe-images --image-ids $1  | jq -r '.Images[].State'); 
		printf "*"
		sleep 3

		if [ "$AMISTATE" == "failed" ]; then
			echo "AMI Creation Failed"
			exit 1
		fi
	done
else
	echo "AMI Creation Failed"
	exit 1
fi
