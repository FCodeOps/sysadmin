# VM Hardening – CentOS Stream 9

## Description

This script performs basic system hardening on a fresh CentOS 9 VM. It's intended to be the first step in setting up a secure, manageable system.

## Features

- Updates all system packages.
- Disables SSH root login.
- Installs `sudo` if not present.
- Creates a non-root administrative user (`sysadmin`) with sudo privileges.
- Forces the new user to change their password on first login.

## Usage

```bash
sudo ./harden_vm.sh

