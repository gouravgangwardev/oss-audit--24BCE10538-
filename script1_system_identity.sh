#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Roll No: [Your Roll No]
# Course: Open Source Software | Chosen Software: Python
# Description: Displays a welcome screen with system info
# ============================================================

# --- Student Variables ---
STUDENT_NAME="[Your Name]"          # Replace with your name
ROLL_NO="[Your Roll Number]"        # Replace with your roll number
SOFTWARE_CHOICE="Python"            # Our chosen open-source software

# --- Gather System Information using command substitution $() ---
KERNEL=$(uname -r)                  # Get the Linux kernel version
USER_NAME=$(whoami)                 # Get the currently logged-in username
HOME_DIR=$HOME                      # Get home directory from environment variable
UPTIME=$(uptime -p)                 # Get human-readable uptime (e.g. "up 2 hours")
CURRENT_DATE=$(date '+%d %B %Y')   # Get today's date in readable format
CURRENT_TIME=$(date '+%H:%M:%S')   # Get current time

# --- Get Linux distro name from the OS release file ---
# /etc/os-release is a standard file present on all modern Linux systems
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# --- Display the System Identity Report ---
echo "============================================================"
echo "        Open Source Software Audit — System Report          "
echo "============================================================"
echo "  Student  : $STUDENT_NAME ($ROLL_NO)"
echo "  Software : $SOFTWARE_CHOICE"
echo "------------------------------------------------------------"
echo "  OS       : $DISTRO"
echo "  Kernel   : $KERNEL"
echo "  User     : $USER_NAME"
echo "  Home Dir : $HOME_DIR"
echo "  Uptime   : $UPTIME"
echo "  Date     : $CURRENT_DATE"
echo "  Time     : $CURRENT_TIME"
echo "------------------------------------------------------------"

# --- Print the license message for the OS ---
# Linux (the kernel running this system) is licensed under GPL v2
echo "  License Note:"
echo "  The Linux kernel powering this system is licensed under"
echo "  the GNU General Public License version 2 (GPL v2)."
echo "  This means you have the freedom to run, study, modify,"
echo "  and redistribute it — the four freedoms of free software."
echo "============================================================"
