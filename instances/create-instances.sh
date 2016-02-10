#!/bin/bash
#   $1 = Environment
#	$2 = Number of nodes
#   $3 = Setup / Mount disks (Y/N)

NUMBER_OF_NODES=$2
NODE_NAME_PREFIX=$1-node

for (( COUNTER=1; COUNTER<=$NUMBER_OF_NODES; COUNTER+=1 )); do

	NODE_NUMBER=`printf %02d $COUNTER`
	NODE_NAME=$NODE_NAME_PREFIX$NODE_NUMBER
	DATA_DISK_NAME=$NODE_NAME_PREFIX$NODE_NUMBER-data
	BOOT_DISK_NAME=$NODE_NAME_PREFIX$NODE_NUMBER-boot

 	echo Creating instance $NODE_NAME

	gcloud compute instances create $NODE_NAME \
	--disk name=$BOOT_DISK_NAME,boot=yes \
	--machine-type n1-standard-1 \
	--can-ip-forward \
	--disk name=$DATA_DISK_NAME,device-name=$DATA_DISK_NAME 
done


