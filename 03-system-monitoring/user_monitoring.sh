#!/bin/bash

# === User Monitoring and Communication Script ===

echo "=== Currently Logged-In Users ==="
who
echo

echo "=== Recent Login History ==="
last
echo

echo "=== Currently Logged-In Users and WHat they're Doing ==="
w
echo

echo "=== Send Private Message to a User ==="
read -p "Enter username: " username
read -p "Enter their TTY (e.g., pts/0): " tty
echo "Type your message below. Press Ctrl+D when done."
write "$username" "$tty"

