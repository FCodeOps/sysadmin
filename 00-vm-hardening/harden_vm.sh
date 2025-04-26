#!/bin/bash

# Usage: sudo ./harden_vm.sh

echo "Starting system hardening..."

# 1. Update all packages
echo "Updating system packages..."
dnf update -y

# 2. Disable root SSH login
echo "Disabling root SSH login..."
sed -i 's/^#\?PermitRootLogin.*/\PermitRootLogin no/' /etc/ssh/sshd_config

# 3. Ensure sudo is installed
echo "Ensuring sudo is installed..."
dnf install -y sudo

# 4. Add a non-root admin user
ADMIN_USER="sysadmin"
if ! id "$ADMIN_USER" &>/dev/null; then
    echo "Creating admin user: $ADMIN_USER"
    useradd -m -s /bin/bash "$ADMIN_USER"
    echo "$ADMIN_USER:ChangeMe123" | chpasswd
    usermod -aG wheel "$ADMIN_USER"  # Add to sudo group
    chage -d 0 "$ADMIN_USER"         # Force password change
else
    echo "User $ADMIN_USER already exists. Skipping."
fi

# 5. Restart SSH service
echo "Restarting SSH service..."
systemctl restart sshd

echo "Basic VM hardening complete."
