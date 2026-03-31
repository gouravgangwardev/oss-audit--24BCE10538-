#!/bin/bash
# Script 2: FOSS Package Inspector
# Reg No: 24BCE10538

PACKAGE="git"

echo "Checking package: $PACKAGE"
echo "--------------------------------"

if command -v git &> /dev/null
then
    echo "Git is installed on this system."
    git --version
else
    echo "Git is NOT installed."
fi

echo ""

case $PACKAGE in
 git)
  echo "Git: A distributed version control system that allows developers to track changes and collaborate freely."
  ;;
 firefox)
  echo "Firefox: A browser focused on privacy and open web standards."
  ;;
 vlc)
  echo "VLC: A powerful open-source media player."
  ;;
 *)
  echo "Unknown package."
  ;;
esac
