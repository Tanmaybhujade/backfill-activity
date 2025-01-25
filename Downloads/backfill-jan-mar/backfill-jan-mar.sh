#!/bin/bash
start="2025-01-25"
end="2025-03-30"

while [ "$start" != "$end" ]; do
  echo "Log for $start $(date +%s)" > "log-$start.txt"
  git add .
  GIT_AUTHOR_DATE="$start 12:00:00" \
  GIT_COMMITTER_DATE="$start 12:00:00" \
  git commit -m "Backdated commit for $start"
  start=$(date -I -d "$start + 1 day")
done
