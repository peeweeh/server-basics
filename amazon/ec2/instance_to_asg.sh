#!/bin/sh
source /var/server-basics/amazon/aws/get_server_info.sh
LAUNCH_CONFIG="$CODENAME-$DAY$MONTH$YEAR-$RANDOM"
echo "********* Create AMI $LAUNCH_CONFIG ********"
main_ami=$(aws ec2 create-image --instance-id $SOURCE_INSTANCE --name $LAUNCH_CONFIG  | jq -r '.ImageId')
sh /var/server-basics/amazon/ec2/ami/wait_for_ami.sh $main_ami
echo "********* Create LAUNCH_CONFIG $LAUNCH_CONFIG ********"
echo "aws autoscaling create-launch-configuration --launch-configuration-name $LAUNCH_CONFIG --image-id $main_ami  --instance-type $INSTANCE_TYPE  --iam-instance-profile $INSTANCE_PROFILE --security-groups $SECURITY_GROUPS $USER_DATA"
aws autoscaling create-launch-configuration --launch-configuration-name $LAUNCH_CONFIG --associate-public-ip-address --image-id $main_ami  --instance-type $INSTANCE_TYPE  --iam-instance-profile $INSTANCE_PROFILE --security-groups $SECURITY_GROUPS $USER_DATA 
echo "********* UPDATE AUTO SCALING GROUP $TARGET_ASG ********"
echo "aws autoscaling update-auto-scaling-group --auto-scaling-group-name $TARGET_ASG --launch-configuration-name $LAUNCH_CONFIG $ASG_SIZE"
echo "aws autoscaling execute-policy --auto-scaling-group-name $TARGET_ASG --policy-name $DEPLOY_POLICY"
aws autoscaling update-auto-scaling-group --auto-scaling-group-name $TARGET_ASG --launch-configuration-name $LAUNCH_CONFIG $ASG_SIZE
aws autoscaling execute-policy --auto-scaling-group-name $TARGET_ASG --policy-name $DEPLOY_POLICY