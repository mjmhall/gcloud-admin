#!/bin/bash
#   $1 = Environment
#	$2 = Disk type 
#	$3 = Number of nodes
#   $4 = disk size 

NUMBER_OF_NODES=$3
NODE_NAME_PREFIX=$1-node
DISK_TYPE=$2
DISK_SIZE=$4
BOOT_TYPE="boot"

for (( COUNTER=1; COUNTER<=$NUMBER_OF_NODES; COUNTER+=1 )); do

	NODE_NUMBER=`printf %02d $COUNTER`
	DISK_NAME=$NODE_NAME_PREFIX$NODE_NUMBER-$DISK_TYPE

    echo Creating disk $DISK_NAME size $DISK_SIZE
    if [[ "$DISK_TYPE" == "$BOOT_TYPE" ]]
    then
		gcloud compute disks create $DISK_NAME \
		--size $DISK_SIZE    \
		--type pd-standard   \
		--zone us-central1-f \
		--image rhel-7
	else
		gcloud compute disks create $DISK_NAME \
		--size $DISK_SIZE    \
		--type pd-standard   \
		--zone us-central1-f 
	fi
done
