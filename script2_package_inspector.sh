#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Roll No: [Your Roll No]
# Course: Open Source Software | Chosen Software: Python
# Description: Checks if a package is installed, shows its
#              version and license, and prints a philosophy note
# ============================================================

# --- Set the package name to check ---
# On Debian/Ubuntu, Python is "python3"
# On RHEL/Fedora, it is also "python3"
PACKAGE="python3"

echo "============================================================"
echo "         FOSS Package Inspector — $PACKAGE                  "
echo "============================================================"

# --- Detect which package manager is available ---
# We use 'command -v' to check if a command exists on this system
if command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
else
    PKG_MANAGER="unknown"
fi

echo "  Detected package manager: $PKG_MANAGER"
echo "------------------------------------------------------------"

# --- if-then-else: Check whether the package is installed ---
if [ "$PKG_MANAGER" = "dpkg" ]; then
    # On Debian/Ubuntu: use dpkg -l and check exit code
    if dpkg -l "$PACKAGE" &>/dev/null; then
        echo "  STATUS: $PACKAGE is INSTALLED on this system."
        echo ""
        # Use dpkg-query to get version and description
        VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
        echo "  Version : $VERSION"
        # Show a summary from the package description
        dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "  Summary : " $0}'
    else
        echo "  STATUS: $PACKAGE is NOT installed."
        echo "  To install it, run: sudo apt install python3"
        exit 1
    fi

elif [ "$PKG_MANAGER" = "rpm" ]; then
    # On RHEL/Fedora: use rpm -q
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "  STATUS: $PACKAGE is INSTALLED on this system."
        echo ""
        # grep with pipe to extract specific fields from rpm info
        rpm -qi "$PACKAGE" | grep -E "^Version|^License|^Summary"
    else
        echo "  STATUS: $PACKAGE is NOT installed."
        echo "  To install it, run: sudo dnf install python3"
        exit 1
    fi

else
    # Fallback: try running python3 directly
    if command -v python3 &>/dev/null; then
        echo "  STATUS: python3 found at: $(which python3)"
        python3 --version
    else
        echo "  STATUS: $PACKAGE could not be found on this system."
        exit 1
    fi
fi

echo ""
echo "------------------------------------------------------------"
echo "  Open Source Philosophy Note:"
echo "------------------------------------------------------------"

# --- case statement: Print a philosophy note based on the package name ---
case $PACKAGE in
    python3|python)
        echo "  Python: Born as a Christmas hobby project in 1989, Python"
        echo "  proved that a language designed for humans — not machines —"
        echo "  could become the most used language in the world. It is"
        echo "  governed by the Python Software Foundation, a non-profit,"
        echo "  and licensed under the permissive PSF License."
        ;;
    httpd|apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  It powers roughly 30% of all websites globally, freely."
        ;;
    mysql|mariadb)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual license model sparked debates about FOSS ethics."
        ;;
    git)
        echo "  Git: Linus Torvalds built this after a proprietary VCS"
        echo "  failed him. Now it is the backbone of all open-source"
        echo "  collaboration globally."
        ;;
    *)
        echo "  $PACKAGE: A tool from the open-source ecosystem."
        echo "  Open-source software powers the modern world."
        ;;
esac

echo "============================================================"
