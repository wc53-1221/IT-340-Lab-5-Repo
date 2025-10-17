#!/bin/bash
# monitor.sh - append system status to logs/system.log
# use absolute paths so cron can run it reliably

LOG_DIR="/home/developers/Lab_5_workspace/logs"
LOG_FILE="$LOG_DIR/system.log"

# ensure log dir exists
mkdir -p "$LOG_DIR"

# timestamp
TS="$(date '+%Y-%m-%d %H:%M:%S')"

{
  echo "========================"
  echo "Timestamp: $TS"
  echo ""
  echo "Uptime:"
  /usr/bin/uptime
  echo ""
  echo "Memory (free -h):"
  /usr/bin/free -h
  echo ""
  echo "Disk (df -h):"
  /bin/df -h
  echo ""
} >> "$LOG_FILE" 2>&1
