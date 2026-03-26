#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Gourav Gangwar | Roll No: 24BCE10538
# Course: Open Source Software | Chosen Software: Python
# Description: Interactively asks 3 questions and generates
#              a personalised open source philosophy statement
#              saved to a .txt file
# ============================================================
echo "============================================================"
echo "        Open Source Manifesto Generator                      "
echo "============================================================"
echo "  Answer three questions to generate your personal manifesto."
echo "  Your answers will be woven into a philosophy statement."
echo ""
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""
read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  Error: All three questions must be answered."
    echo "  Please run the script again and fill in all answers."
    exit 1
fi
DATE=$(date '+%d %B %Y')            
AUTHOR=$(whoami)                   
OUTPUT="manifesto_${AUTHOR}.txt"
echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo "============================================================" > "$OUTPUT"
echo "        MY OPEN SOURCE MANIFESTO                            " >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "  Author  : $AUTHOR"                                          >> "$OUTPUT"
echo "  Date    : $DATE"                                            >> "$OUTPUT"
echo "  Course  : Open Source Software"                            >> "$OUTPUT"
echo "------------------------------------------------------------" >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"
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
echo ""
echo "  Manifesto successfully saved to: $OUTPUT"
echo "------------------------------------------------------------"
echo ""
cat "$OUTPUT"
echo ""
echo "============================================================"
echo "  File '$OUTPUT' has been created in the current directory."
echo "  Submit this file along with your project report."
echo "============================================================"
