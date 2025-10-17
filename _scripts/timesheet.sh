#!/bin/bash
# timesheet.sh - interactive timesheet entry, appends to logs/timesheet.log

LOG_DIR="/home/developers/Lab_5_workspace/logs"
LOG_FILE="$LOG_DIR/timesheet.log"

mkdir -p "$LOG_DIR"

read -p "First Name: " fname
read -p "Last Name: " lname

# read hours (allow decimals), validate simple numeric
while true; do
  read -p "Number of Hours Worked: " hours
  # accept integers or decimals
  if [[ $hours =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    break
  else
    echo "Please enter a valid number (e.g. 3 or 3.5)."
  fi
done

read -p "Description of Work: " description

TS="$(date '+%Y-%m-%d %H:%M:%S')"

# append a readable entry
{
  echo "------------------------"
  echo "Timestamp: $TS"
  echo "Name: $fname $lname"
  echo "Hours: $hours"
  echo "Work: $description"
  echo ""
} >> "$LOG_FILE"

echo "Timesheet recorded to $LOG_FILE"
