#!/bin/bash

set -e

# === CONFIG ===
ADMIN_GROUP="admin"
STAFF_GROUP="staff"
LOG_FILE="/var/log/user_mgmt.log"
PASSWORD_MAX_DAYS=90
PASSWORD_WARN_DAYS=7
PASSWORD_MIN_DAYS=5
INACTIVE_DAYS=90

# === Functions ===

log_action() {
    if [ ! -f "$LOG_FILE" ]; then
        sudo touch "$LOG_FILE"
        sudo chmod 644 "$LOG_FILE"  # Set proper permissions
    fi	
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

ensure_group_exists() {
	local groupname=$1
	if ! getent group "$groupname" > /dev/null; then
		echo "Group '$groupname' does not exist. Creating..."
		log_action "Group '$groupname' does not exist. Creating..."
		sudo groupadd "$groupname"
		log_action "Group '$groupname' created."
		echo "Group '$groupname' created."
	else
		log_action "Group '$groupname' already exists."
		echo "Group '$groupname' already exists."
	fi
}

add_user_to_groups() {
    local username=$1
    for group in "$ADMIN_GROUP" "$STAFF_GROUP"; do
        ensure_group_exists "$group"
        sudo usermod -aG "$group" "$username"
        log_action "Added user '$username' to group '$group'."
    done
}


set_password_expiry() {
    local username=$1
    sudo chage -M "$PASSWORD_MAX_DAYS" -W "$PASSWORD_WARN_DAYS" -m "$PASSWORD_MIN_DAYS" "$username"
    log_action "Set password policy for '$username'. Max: $PASSWORD_MAX_DAYS days, Warn: $PASSWORD_WARN_DAYS days, Min: $PASSWORD_MIN_DAYS days."
}

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 {ensure_group_exists|add_user_to_groups|set_password_expiry} username"
    exit 1
fi

command="$1"
username="$2"

case "$command" in
    ensure_group_exists)
        ensure_group_exists "$username"
        ;;
    add_user_to_groups)
        add_user_to_groups "$username"
        ;;
    set_password_expiry)
        set_password_expiry "$username"
        ;;
    *)
        echo "Invalid command."
        echo "Usage: $0 {ensure_group_exists|add_user_to_groups|set_password_expiry} username"
        exit 1
        ;;
esac
