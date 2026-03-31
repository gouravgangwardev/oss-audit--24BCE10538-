#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Reg No: 24BCE10538

echo "Answer a few questions to generate your manifesto"
echo ""

read -p "1. Tool you use daily: " TOOL
read -p "2. What does freedom mean to you? " FREEDOM
read -p "3. What would you build openly? " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_24BCE11274.txt"

echo "--------------------------------" > $OUTPUT
echo "Open Source Manifesto" >> $OUTPUT
echo "Date: $DATE" >> $OUTPUT
echo "" >> $OUTPUT

echo "I regularly use $TOOL in my daily work. For me, freedom means $FREEDOM." >> $OUTPUT
echo "In the future, I would like to build $BUILD and share it openly so others can learn and improve it." >> $OUTPUT

echo ""
echo "Manifesto saved in $OUTPUT"
cat $OUTPUT
