#!/bin/bash
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
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Try using: /var/log/syslog or /var/log/messages"
    exit 1
fi
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: The file '$LOGFILE' is empty. Nothing to analyze."
    exit 0
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
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    
    fi
done < "$LOGFILE"    
echo "------------------------------------------------------------"
echo "  RESULT: Keyword '$KEYWORD' was found $COUNT time(s)"
echo "          in the file: $LOGFILE"
echo "------------------------------------------------------------"
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
TOTAL_LINES=$(wc -l < "$LOGFILE")
echo "  Total lines in file : $TOTAL_LINES"
echo "  Lines with keyword  : $COUNT"
if [ "$TOTAL_LINES" -gt 0 ]; then
    PERCENT=$(( COUNT * 100 / TOTAL_LINES ))
    echo "  Match percentage    : ~$PERCENT%"
fi
echo "============================================================"
