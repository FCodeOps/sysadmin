#!/bin/bash

set -e

DEFAULT_PASSWORD="ChangeMe123!"
USER_SHELL="/bin/bash"

create_user() {
	local username=$1
	local group=$2

	echo "Creating user: $username"

	# Create user with home directory and default shell
	useradd -m -s "$USER_SHELL" "$username"

	# Set default password
	echo "$username:$DEFAULT_PASSWORD" | chpasswd

	# Force password change on first login
	chage -d 0 "$username"

	if [ -n "$group" ]; then
		echo "Adding $username to group $group"
		usermod -aG "$group" "$username"
	fi

	echo "User $username created suuccessfully."
}

lock_user() {
	local username=$1
	echo "Locking user: $username"
	passwd -l "$username"
}

unlock_user() {
	local username=$1
	echo "Unlocking user: $username"
	passwd -u "$username"
}

delete_user() {
	local username=$1
	echo "Deleting user: $username"
	userdel -r "$username"
}

# Example usage
# create_user michael admins
# lock_user michael
# unlock_user michael
# delete_user larry
