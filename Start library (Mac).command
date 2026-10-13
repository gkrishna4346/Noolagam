#!/bin/bash
# Starts "My library" on this Mac. Keep this window open while reading.
cd "$(dirname "$0")"
PORT=8642
while lsof -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; do PORT=$((PORT+1)); done
if command -v python3 >/dev/null 2>&1 && python3 -c "" >/dev/null 2>&1; then
  echo ""
  echo "  En Noolagam / My library is running at http://localhost:$PORT/"
  echo "  Keep this window open while you read. Close it to stop."
  echo ""
  (sleep 1; open "http://localhost:$PORT/index.html") &
  python3 -m http.server $PORT --bind 127.0.0.1 >/dev/null 2>&1
else
  echo "Python 3 isn't installed, so opening the page directly instead."
  open index.html
fi
