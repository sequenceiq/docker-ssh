#!/bin/bash

yum install -y openssh-server openssh-clients

ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

# fix the 254 error code
sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
echo "UsePAM no" >> /etc/ssh/sshd_config
