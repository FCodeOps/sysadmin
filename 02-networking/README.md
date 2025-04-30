## Networking Setup

This folder contains scripts and configuration examples to set up basic networking services on a CentOS/RHEL-based system.

---

## Contents

- `dhcp_setup.sh` — Installs, configures, and starts a DHCP server using `dhcpd`.
- `dns_setup.sh` — Installs and sets up a basic BIND DNS server.
- `firewall_setup.sh` — Applies basic firewall rules to allow common services.

---

## DHCP Server

- Uses `dhcpd` to assign IP addresses.
- Configuration file: `/etc/dhcp/dhcpd.conf`
- Script enables and start

## Firewall

- Script uses `firewalld` to:
  - Allow SSH, DHCP, and DNS traffic.
  - Reload the firewall rules.
---

## Usage

```bash
chmod +x *.sh
sudo ./dhcp_setup.sh
sudo ./dns_setup.sh
sudo ./firewall_setup.sh
