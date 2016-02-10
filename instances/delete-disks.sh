#!/bin/bash
#   $1 = Environment
#	$2 = Disk type 
#	$3 = Number of nodes

NUMBER_OF_NODES=$3
NODE_NAME_PREFIX=$1-node
DISK_TYPE=$2

for (( COUNTER=1; COUNTER<=$NUMBER_OF_NODES; COUNTER+=1 )); do

	NODE_NUMBER=`printf %02d $COUNTER`
	DISK_NAME=$NODE_NAME_PREFIX$NODE_NUMBER-$DISK_TYPE

    echo Deleting disk $DISK_NAME
	gcloud compute disks delete $DISK_NAME --quiet
done
