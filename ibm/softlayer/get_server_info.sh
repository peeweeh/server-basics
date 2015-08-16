#!/bin/sh
echo "********* Get Instance Metadata ********"
export YEAR=$(date +"%Y")
export DAY=$(date +"%d")
export MONTH=$(date +"%m")
export HOUR=$(date +"%H")
export IP=$(hostname -i)