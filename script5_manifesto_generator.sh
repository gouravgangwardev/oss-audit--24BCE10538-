#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Roll No: [Your Roll No]
# Course: Open Source Software | Chosen Software: Python
# Description: Interactively asks 3 questions and generates
#              a personalised open source philosophy statement
#              saved to a .txt file
# ============================================================

# --- Alias concept demonstration ---
# In a real shell session, you can define shortcuts like this:
# alias pycheck='python3 --version'
# Here we demonstrate the concept via a comment as the script
# environment does not persist aliases between sessions.

echo "============================================================"
echo "        Open Source Manifesto Generator                      "
echo "============================================================"
echo "  Answer three questions to generate your personal manifesto."
echo "  Your answers will be woven into a philosophy statement."
echo ""

# --- Read user input interactively ---
# 'read -p' displays a prompt and waits for the user to type an answer

read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Validate that all fields were filled in ---
# -z checks if a string is empty
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  Error: All three questions must be answered."
    echo "  Please run the script again and fill in all answers."
    exit 1
fi

# --- Gather metadata for the manifesto ---
DATE=$(date '+%d %B %Y')            # Current date in readable format
AUTHOR=$(whoami)                    # The Linux username of the person running this

# --- Define the output filename using string concatenation ---
# The filename includes the username to make it unique
OUTPUT="manifesto_${AUTHOR}.txt"

echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"

# --- Write the manifesto to the file using > (overwrite) ---
# Using echo with >> would append; we use > first to create/overwrite

echo "============================================================" > "$OUTPUT"
echo "        MY OPEN SOURCE MANIFESTO                            " >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "  Author  : $AUTHOR"                                          >> "$OUTPUT"
echo "  Date    : $DATE"                                            >> "$OUTPUT"
echo "  Course  : Open Source Software"                            >> "$OUTPUT"
echo "------------------------------------------------------------" >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"

# --- Compose the personalised paragraph using string variables ---
# This is string concatenation through multi-line echo statements
echo "  Every day, I rely on $TOOL — a piece of software built"   >> "$OUTPUT"
echo "  not by a corporation seeking profit, but by a community"   >> "$OUTPUT"
echo "  of people who believed that technology should be shared."  >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. In the context of software," >> "$OUTPUT"
echo "  that word takes on a precise meaning: the freedom to run," >> "$OUTPUT"
echo "  to read, to modify, and to share. These are not just"     >> "$OUTPUT"
echo "  technical permissions — they are philosophical commitments." >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"
echo "  If I could build one thing and share it with the world,"  >> "$OUTPUT"
echo "  it would be $BUILD. I would make it open source, because" >> "$OUTPUT"
echo "  the greatest software in history — Linux, Python, the web" >> "$OUTPUT"
echo "  itself — was not locked away. It was given freely, so that" >> "$OUTPUT"
echo "  others could stand on it, improve it, and pass it on."    >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"
echo "  This is what open source means to me."                    >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"
echo "  — $AUTHOR | $DATE"                                         >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm and display the saved file ---
echo ""
echo "  Manifesto successfully saved to: $OUTPUT"
echo "------------------------------------------------------------"
echo ""

# --- cat: Display the file contents on screen ---
cat "$OUTPUT"

echo ""
echo "============================================================"
echo "  File '$OUTPUT' has been created in the current directory."
echo "  Submit this file along with your project report."
echo "============================================================"
