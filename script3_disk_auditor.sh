#!/bin/bash
set -e
# Run using: chmod +x script3_disk_permission_auditor.sh && ./script3_disk_permission_auditor.sh
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Gourav Gangwar | Roll No: 24BCE10538
# Course: Open Source Software | Chosen Software: Python
# Description: Loops through key system directories, reports
#              their permissions, owner, group, and disk usage
# ============================================================

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib")

echo "============================================================"
echo "          Disk and Permission Auditor Report                 "
echo "============================================================"

printf "%-20s %-20s %-12s %-8s %-10s\n" "Directory" "Permissions+Owner" "Group" "Size" "Disk%"
echo "------------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then

       
        # which is redundant — one syscall is enough for all three fields
        LS_INFO=$(ls -ld "$DIR")

       
        PERMS=$(echo "$LS_INFO" | awk '{print $1}')
        OWNER=$(echo "$LS_INFO" | awk '{print $3}')
        GROUP=$(echo "$LS_INFO" | awk '{print $4}')

        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

      
        # df -h "$DIR" shows the filesystem that contains the directory
        # awk NR==2 skips the header row; $5 is the Use% column
        DISK_PCT=$(df -h "$DIR" 2>/dev/null | awk 'NR==2 {print $5}')

        printf "%-20s %-20s %-12s %-8s %-10s\n" "$DIR" "$PERMS ($OWNER)" "$GROUP" "$SIZE" "$DISK_PCT"

    else
        printf "%-20s %s\n" "$DIR" "[Does not exist on this system]"
    fi
done

echo "------------------------------------------------------------"
echo ""
echo "  Python-Specific Directory Check:"
echo "------------------------------------------------------------"

PYTHON_LIB=$(ls -d /usr/lib/python3* 2>/dev/null | head -1)

if [ -n "$PYTHON_LIB" ]; then

    
    PY_LS_INFO=$(ls -ld "$PYTHON_LIB")
    PY_PERMS=$(echo "$PY_LS_INFO" | awk '{print $1, $3, $4}')
    PY_SIZE=$(du -sh "$PYTHON_LIB" 2>/dev/null | cut -f1)

    PY_DISK_PCT=$(df -h "$PYTHON_LIB" 2>/dev/null | awk 'NR==2 {print $5}')

    echo "  Python lib dir : $PYTHON_LIB"
    echo "  Permissions    : $PY_PERMS"
    echo "  Size           : $PY_SIZE"
    echo "  Disk Usage     : $PY_DISK_PCT"

else
    echo "  Python library directory not found at /usr/lib/python3*"
    echo "  Python may not be installed, or is in a non-standard location."
fi

PYTHON_BIN=$(which python3 2>/dev/null)
if [ -n "$PYTHON_BIN" ]; then


    BIN_LS_INFO=$(ls -la "$PYTHON_BIN")
    BIN_PERMS=$(echo "$BIN_LS_INFO" | awk '{print $1, $3, $4}')

    echo "  Python binary  : $PYTHON_BIN"
    echo "  Binary perms   : $BIN_PERMS"
fi

echo "============================================================"
echo "  Note: Directories owned by 'root' with restricted write"
echo "  permissions protect system integrity — a core Linux"
echo "  security principle also used by open-source projects."
echo "============================================================"
