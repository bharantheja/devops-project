#!/bin/bash
# Simple System Health Monitor
# Author: B. Sai Bharan Theja | CTIS5524

echo "=============================="
echo "  SYSTEM HEALTH REPORT"
echo "  Date: $(date)"
echo "=============================="

echo ""
echo "--- CPU Usage ---"
cpu=$(awk '/^cpu /{t=$2+$3+$4+$5+$6+$7+$8; idle=$5; pct=(t>0)?(t-idle)*100/t:0; printf "%d",pct}' /proc/stat)
echo "CPU Used: $cpu%"

echo ""
echo "--- Memory Usage ---"
total=$(awk '/MemTotal/     {print $2}' /proc/meminfo)
free=$(awk  '/MemAvailable/ {print $2}' /proc/meminfo)
used=$(( total - free ))
echo "Used: $(( used/1024 )) MB  |  Total: $(( total/1024 )) MB"

echo ""
echo "--- Disk Usage ---"
df -h /

echo ""
echo "--- App Status ---"
if curl -s http://localhost:5000/health | grep -q "OK"; then
    echo "Flask App: RUNNING"
else
    echo "Flask App: NOT RUNNING"
fi

echo ""
echo "=============================="
echo "  Done!"
echo "=============================="
