#!/bin/bash
#   $1 = Environment
#	$2 = Number of nodes

NUMBER_OF_NODES=$2
NODE_NAME_PREFIX=$1-node

for (( COUNTER=1; COUNTER<=$NUMBER_OF_NODES; COUNTER+=1 )); do

	NODE_NUMBER=`printf %02d $COUNTER`
	NODE_NAME=$NODE_NAME_PREFIX$NODE_NUMBER

    echo copying files to $NODE_NAME
	gcloud compute copy-files ./fdisk.input $NODE_NAME:~ 
done

