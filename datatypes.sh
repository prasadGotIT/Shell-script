#!/bin/bash
NUMBER1=100
NUMBER2=200
SUM=$((NUMBER1+NUMBER2))
echo "The sum of $NUMBER1 and $NUMBER2 is: $SUM"
LEADERS=("Modi" "putin" "Trump")
echo "All leaders: ${LEADERS[@]}"

echo "First Leader: ${LEADERS[0]}"
