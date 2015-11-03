#!/bin/bash

#curl 'http://172.16.0.1:81/openstack.repo' -o '/etc/yum.repos.d/openstack.repo';

# Permit root login over SSH
sed -i 's/.*ssh-rsa/ssh-rsa/' /root/.ssh/authorized_keys
sed -i 's/PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config

systemctl restart sshd

# Update the root password to something we know
echo redhat | sudo passwd root --stdin

#yum install -y device-mapper-multipath

#cat << FOE > /etc/multipath.conf
#defaults {
#        find_multipaths yes
#        user_friendly_names yes
#}


#blacklist {
#}
#FOE

#systemctl start  multipathd.service
#systemctl enable multipathd.service