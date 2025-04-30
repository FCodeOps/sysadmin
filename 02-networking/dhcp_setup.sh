#!/bin/bash

systemctl enable dhcpd
systemctl start dhcpd
echo "DHCP server started."
