#!/bin/sh
echo "********* Validate all Cloudformation Templates ********"

if [ -z "$1" ]; then
  TEMPLATE_FOLDER="./"
else
  TEMPLATE_FOLDER=$1
fi


if [ -z "$2" ]; then
  AWS_REGION="us-east-1"
else
  AWS_REGION=$2
fi

echo "*********** Testing on Region: $AWS_REGION "
echo "*********** Testing on Folder: $TEMPLATE_FOLDER "
for f in $(find $TEMPLATE_FOLDER -name '*.yml' -or -name '*.yaml' -or -name '*.json'); do echo "************* Validating $f" && aws cloudformation validate-template --region $AWS_REGION --template-body file://$f; done