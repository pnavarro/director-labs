#!/bin/bash
mkdir -p /nfsshare/glance
mkdir -p /nfsshare/cinder
mkdir -p /nfsshare/nova
#lvremove /dev/nfs_vg/nfs_lv
#vgremove nfs_vg
#pvremove /dev/sdb
pvcreate /dev/sdb
vgcreate nfs_vg /dev/sdb
lvcreate -l100%FREE -n nfs_lv nfs_vg
mkfs.ext4 /dev/nfs_vg/nfs_lv
sed -i '/# volume_list = \[.*/a volume_list = []' /etc/lvm/lvm.conf
dracut -H -f /boot/initramfs-3.10.0-229.14.1.el7.x86_64.img 3.10.0-229.14.1.el7.x86_64