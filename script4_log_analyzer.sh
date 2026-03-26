#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: [Your Name] | Roll No: [Your Roll No]
# Course: Open Source Software | Chosen Software: Python
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints a summary with examples
# Usage: ./script4_log_analyzer.sh /path/to/logfile [KEYWORD]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Accept command-line arguments ---
# $1 is the first argument (log file path)
# $2 is the second argument (keyword), defaults to "error" if not given
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error' if not provided

# --- Counter variable to track keyword matches ---
COUNT=0

# --- Validate that a log file path was given ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- if-then: Check if the log file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Try using: /var/log/syslog or /var/log/messages"
    exit 1
fi

# --- Check if the file is empty ---
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

# --- while read loop: Read the file one line at a time ---
# IFS= ensures leading/trailing whitespace is preserved
# -r flag prevents backslash interpretation
while IFS= read -r LINE; do

    # --- if-then inside the loop: Check if this line contains the keyword ---
    # grep -iq: -i = case insensitive, -q = quiet (no output, just exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    # Increment counter using arithmetic expansion
    fi

done < "$LOGFILE"    # Feed the file into the while loop via input redirection

# --- Display the summary ---
echo "------------------------------------------------------------"
echo "  RESULT: Keyword '$KEYWORD' was found $COUNT time(s)"
echo "          in the file: $LOGFILE"
echo "------------------------------------------------------------"

# --- Show the last 5 matching lines for context ---
echo ""
echo "  Last 5 lines containing '$KEYWORD':"
echo "------------------------------------------------------------"

# grep -i for case-insensitive, pipe to tail to get last 5 matches
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -n "$MATCHES" ]; then
    # Print each match with a line prefix
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
else
    echo "  (No matches found)"
fi

echo "------------------------------------------------------------"

# --- Print total line count for context ---
TOTAL_LINES=$(wc -l < "$LOGFILE")
echo "  Total lines in file : $TOTAL_LINES"
echo "  Lines with keyword  : $COUNT"

# Calculate percentage if total lines > 0
if [ "$TOTAL_LINES" -gt 0 ]; then
    PERCENT=$(( COUNT * 100 / TOTAL_LINES ))
    echo "  Match percentage    : ~$PERCENT%"
fi

echo "============================================================"
