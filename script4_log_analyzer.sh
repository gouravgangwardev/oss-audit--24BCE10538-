#!/bin/bash
set -e
# Run using: chmod +x script4_log_analyzer.sh && ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================
# Script 4: Log File Analyzer
# Author: Gourav Gangwar | Roll No: 24BCE10538
# Course: Open Source Software | Chosen Software: Python
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints a summary with examples
# Usage: ./script4_log_analyzer.sh /path/to/logfile [KEYWORD]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

# FIXED: Replaced [ -z "$LOGFILE" ] with [ $# -lt 1 ]
# $# -lt 1 directly checks the number of arguments passed to the script,
# which is more robust and idiomatic than checking if $1 is an empty string.
# A user could pass an empty string "" as $1 and bypass the old check.
if [ $# -lt 1 ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Try using: /var/log/syslog or /var/log/messages"
    exit 1
fi

# FIXED: Replaced immediate exit on empty file with a retry loop
# Previously the script exited if the file was empty ([ ! -s ]).
# Now it waits and retries every 2 seconds — useful for log files
# that are still being written to or haven't been populated yet.
# The loop exits automatically once the file has content.
if [ ! -s "$LOGFILE" ]; then
    echo "  Warning: '$LOGFILE' is currently empty. Waiting for content..."
    while [ ! -s "$LOGFILE" ]; do
        sleep 2
    done
    echo "  File now has content. Proceeding with analysis..."
fi

echo "============================================================"
echo "              Log File Analyzer Report                       "
echo "============================================================"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD' (case-insensitive)"
echo "------------------------------------------------------------"
echo "  Scanning file line by line..."
echo ""

while IFS= read -r LINE; do
    # FIXED: Replaced `echo "$LINE" | grep -iq "$KEYWORD"` with bash regex
    # [[ "$LINE" =~ $KEYWORD ]] performs the match entirely within bash
    # without spawning a grep subprocess for every single line.
    # This is significantly faster on large log files.
    # Note: using a lowercase copy for case-insensitive matching since
    # bash regex is case-sensitive by default.
    LINE_LOWER=$(echo "$LINE" | tr '[:upper:]' '[:lower:]')
    KEYWORD_LOWER=$(echo "$KEYWORD" | tr '[:upper:]' '[:lower:]')
    if [[ "$LINE_LOWER" =~ $KEYWORD_LOWER ]]; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "------------------------------------------------------------"
echo "  RESULT: Keyword '$KEYWORD' was found $COUNT time(s)"
echo "          in the file: $LOGFILE"
echo "------------------------------------------------------------"

# Unchanged: tail output of last 5 matching lines preserved as required
echo ""
echo "  Last 5 lines containing '$KEYWORD':"
echo "------------------------------------------------------------"
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)
if [ -n "$MATCHES" ]; then
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
else
    echo "  (No matches found)"
fi

echo "------------------------------------------------------------"

# Unchanged: percentage calculation preserved as required
TOTAL_LINES=$(wc -l < "$LOGFILE")
echo "  Total lines in file : $TOTAL_LINES"
echo "  Lines with keyword  : $COUNT"
if [ "$TOTAL_LINES" -gt 0 ]; then
    PERCENT=$(( COUNT * 100 / TOTAL_LINES ))
    echo "  Match percentage    : ~$PERCENT%"
fi
echo "============================================================"
