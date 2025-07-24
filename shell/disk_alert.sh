#!/bin/bash

# Threshold for alert
THRESHOLD=80
EMAIL="admin@example.com"

# Get disk usage for root
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "Disk usage on root is ${USAGE}% (above threshold of ${THRESHOLD}%)" | \
  mail -s "Disk Usage Alert: ${USAGE}%" "$EMAIL"
fi
