#!/bin/bash
NUMBER=$1
if[($NUMBER -lt 10)] then;
  echo "Given $NUMBER is less than 10"
else
  echo "Given $NUMBER is greaterthan or equal to 10"
fi
  