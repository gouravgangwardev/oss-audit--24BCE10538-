#!/bin/bash
set -e  # FIXED: Exit immediately on any error
# Run using: chmod +x script1_system_identity.sh && ./script1_system_identity.sh  # FIXED: Added run instruction
# ============================================================
# Script 1: System Identity Report
# Author: Gourav Gangwar | Roll No: 24BCE10538
# Course: Open Source Software | Chosen Software: Python
# Description: Displays a welcome screen with system info
# ============================================================
STUDENT_NAME="Gourav Gangwar"
ROLL_NO="24BCE10538"
SOFTWARE_CHOICE="Python"
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S')
if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi
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
echo "  License Note:"
echo "  The Linux kernel powering this system is licensed under"
echo "  the GNU General Public License version 2 (GPL v2)."
echo "  This means you have the freedom to run, study, modify,"
echo "  and redistribute it — the four freedoms of free software."
echo "============================================================"
