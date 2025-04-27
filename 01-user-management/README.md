# User Management Scripts

This folder contains Bash scripts to automate basic user and group management tasks on a Linux system.  
---

## Features

- Create required groups (`admin`, `staff`) if missing.
- Add users to the `admin` and `staff` groups.
- Set password expiration policies:
  - **Maximum age**: 90 days
  - **Warning period**: 7 days
  - **Minimum age**: 5 days
- Log all actions to `/var/log/user_mgmt.log`.

---

## Usage

Run the script with `sudo`:

```bash
sudo ./group_pass_management.sh <function_name> <username>

