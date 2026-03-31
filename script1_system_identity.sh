#!/bin/bash
# Script 1: System Identity Report
# Name: Gourav Gangwar
# Reg No: 24BCE10538

STUDENT_NAME="Gourav Gangwar"
REG_NO="24BCE10538"
SOFTWARE="Git"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE=$(date)
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')

echo "========================================"
echo " Open Source Audit"
echo " Name: $STUDENT_NAME"
echo " Reg No: $REG_NO"
echo "========================================"

echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home Dir     : $HOME"
echo "Uptime       : $UPTIME"
echo "Date & Time  : $DATE"

echo ""
echo "This system is based on open-source principles (GPL License)."
