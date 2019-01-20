#!/bin/bash

# at /home/vagrant
#---hosts---
cat >>/etc/hosts <<EOF

192.168.33.11  docker


EOF

#---ssh---
mv /home/vagrant/sshd_config /etc/ssh/sshd_config
sudo systemctl restart sshd.service
