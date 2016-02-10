#!/bin/bash

# resize boot disk

cat << EOF > fdisk.input
d
n
p
1


w
EOF

sudo fdisk /dev/sda < fdisk.input

# Format data disks

sudo mkfs.ext3 -F /dev/sdb
sudo mkdir -p /srv/hdfs/data

# fstab entry

echo "dev/sdb /srv/hdfs/data ext3 defaults,noatime 0 2" | sudo tee --append /etc/fstab

sudo mount -o discard,defaults /dev/sdb /srv/hdfs/data

#sudo reboot
#sudo xfs_growfs /
