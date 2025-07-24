#!/bin/bash

# Directory to clean logs
LOG_DIR="/var/log/myapp"

# Find and delete .log files older than 7 days
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -exec rm -f {} \;
