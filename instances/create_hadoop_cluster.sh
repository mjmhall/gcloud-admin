#!/bin/bash
#	$1 = Number of nodes

NODES=$1

# Create data disks

./create-disks.sh dev data 4 200

# Create boot disks 
	
./create-disks.sh dev boot 4 200


./create-instances.sh dev 4



