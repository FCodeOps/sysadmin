#!/bin/bash

# === Simple System Info Script ===

echo "===== Date and Time ====="
date

echo
echo "===== System Uptime ====="
uptime

echo
echo "===== Hostname ====="
hostname

echo
echo "===== System Information (uname) ====="
uname -a

echo
echo "===== Locations of Commands (which) ====="
echo "which date:"
which date
echo "which uptime:"
which uptime
echo "which hostname:"
which hostname
echo "which uname:"
which uname
echo "which cal:"
which cal
echo "which bc:"
which bc

echo
echo "===== Calendar ====="
cal

echo
echo "===== Basic Calculator (bc) Example ====="
echo "2 + 3" | bc

