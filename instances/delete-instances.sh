#!/bin/bash
#   $1 = Environment
#	$2 = Number of nodes
#   $3 = Setup / Mount disks (Y/N)

NUMBER_OF_NODES=$2
NODE_NAME_PREFIX=$1-node

for (( COUNTER=1; COUNTER<=$NUMBER_OF_NODES; COUNTER+=1 )); do

	NODE_NUMBER=`printf %02d $COUNTER`
	NODE_NAME=$NODE_NAME_PREFIX$NODE_NUMBER

 	echo Deleting instance $NODE_NAME

	gcloud compute instances delete $NODE_NAME 
done


