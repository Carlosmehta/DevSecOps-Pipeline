#!/bin/bash
DIR_TO_SCAN="."
LOGFILE="/tmp/clamav_scan.log"

clamscan -r $DIR_TO_SCAN > $LOGFILE

if grep -q "Infected files: 0" $LOGFILE; then
  echo "✅ No infected files found."
else
  echo "🦠 ClamAV found infected files!"
  tail -n 10 $LOGFILE
fi

