#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Roll No: [Your Roll No]
# Course: Open Source Software | Chosen Software: Python
# Description: Loops through key system directories, reports
#              their permissions, owner, group, and disk usage
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib")

echo "============================================================"
echo "          Disk and Permission Auditor Report                 "
echo "============================================================"
printf "%-20s %-20s %-15s %-10s\n" "Directory" "Permissions+Owner" "Group" "Size"
echo "------------------------------------------------------------"

# --- for loop: Iterate over each directory in the list ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory exists using -d flag
    if [ -d "$DIR" ]; then

        # Extract permissions, owner, and group using ls -ld
        # awk splits the output by whitespace and picks specific fields:
        # $1 = permissions, $3 = owner user, $4 = owner group
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # Get the disk usage of the directory
        # du -sh gives human-readable size, cut -f1 takes only the size part
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted output for each directory
        printf "%-20s %-20s %-15s %-10s\n" "$DIR" "$PERMS ($OWNER)" "$GROUP" "$SIZE"

    else
        # Directory doesn't exist on this system
        printf "%-20s %s\n" "$DIR" "[Does not exist on this system]"
    fi

done

echo "------------------------------------------------------------"

# --- Check Python-specific directories ---
echo ""
echo "  Python-Specific Directory Check:"
echo "------------------------------------------------------------"

# Python libraries are typically stored in /usr/lib/python3.x
# We use a wildcard to find the actual version directory
PYTHON_LIB=$(ls -d /usr/lib/python3* 2>/dev/null | head -1)

if [ -n "$PYTHON_LIB" ]; then
    # Directory was found — report its permissions
    PY_PERMS=$(ls -ld "$PYTHON_LIB" | awk '{print $1, $3, $4}')
    PY_SIZE=$(du -sh "$PYTHON_LIB" 2>/dev/null | cut -f1)
    echo "  Python lib dir : $PYTHON_LIB"
    echo "  Permissions    : $PY_PERMS"
    echo "  Size           : $PY_SIZE"
else
    echo "  Python library directory not found at /usr/lib/python3*"
    echo "  Python may not be installed, or is in a non-standard location."
fi

# Also check where the python3 binary lives
PYTHON_BIN=$(which python3 2>/dev/null)
if [ -n "$PYTHON_BIN" ]; then
    BIN_PERMS=$(ls -la "$PYTHON_BIN" | awk '{print $1, $3, $4}')
    echo "  Python binary  : $PYTHON_BIN"
    echo "  Binary perms   : $BIN_PERMS"
fi

echo "============================================================"
echo "  Note: Directories owned by 'root' with restricted write"
echo "  permissions protect system integrity — a core Linux"
echo "  security principle also used by open-source projects."
echo "============================================================"
