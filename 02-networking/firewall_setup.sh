#!/bin/bash
firewall-cmd --permanent --add-service=dhcp
sudo firewall-cmd --permanent --add-port=54625/tcp
sudo firewall-cmd --permanent --remove-service=ssh
firewall-cmd --permanent --add-service=dns
firewall-cmd --reload
echo "Firewall rules applied."
