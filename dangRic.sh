#!/bin/bash

# This script attempts to locate potential dangling domains on AWS. You need AWS CLI installed and your keys configured
# Make sure you insert your Bing API key below as well.
# All the sleeps were necessary to not allocate the same IP address multiple times

  COUNTER=0
         

while true
do
	let COUNTER=COUNTER+1 
	unset IP
	unset ALLOCID
	unset RESULTS	 
	
    if [ $COUNTER -eq 100 ]; then
   	echo "Reaching $COUNTER stoping now..."
   	break 
   	fi
   	echo "Attempt number $COUNTER"
	IP=$(aws ec2 allocate-address --region us-west-1 --output text --query 'PublicIp')
	sleep 10
	ALLOCID=$(aws ec2 describe-addresses --region us-west-1 --output text --query 'Addresses[0].AllocationId')
	echo "Checking address: $IP with allocID: $ALLOCID"	
	sleep 10
	# Put your Bing v7.0 API key in the next line after Ocp-Apim-Subscription-Key
	RESULTS=$(curl -s -H "Ocp-Apim-Subscription-Key: fd115aa938fa4d97xxxx" "https://api.bing.microsoft.com/v7.0/search?q=ip:$IP&count=1&mkt-en-us")
	echo "$RESULTS"
	if echo "$RESULTS" | grep 'displayUrl'; then
		echo "We found one! $IP"
		break
	else
		echo "Releasing Address $IP with allocID: $ALLOCID"		
		RELEASE=$(aws ec2 release-address --region us-west-1 --allocation-id $ALLOCID)
		sleep 
	fi
	echo "$i"
done


#curl -s -H "Ocp-Apim-Subscription-Key: fd115aa938fa4d9787fa0aff12dfaf8f" "https://api.bing.microsoft.com/v7.0/search?q=ip:54.215.84.14&count=1&mkt-en-us"
#aws ec2 release-address --public-ip 54.177.231.247