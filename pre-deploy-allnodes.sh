#!/bin/bash
mkdir -p /nfsshare/glance
mkdir -p /nfsshare/cinder
mkdir -p /nfsshare/nova
sed -i '/# volume_list = \[.*/a volume_list = []' /etc/lvm/lvm.conf
dracut -H -f /boot/initramfs-$(uname -r).img $(uname -r)
