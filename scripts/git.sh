#!/usr/bin/bash

BASE_DIR="${1:-$HOME/Workspaces}"

find "$BASE_DIR" -type d -name ".git" -print0 | while IFS= read -r -d '' gitdir; do
  repodir=$(dirname "$gitdir")
  status=$(git -C "$repodir" status --porcelain 2>/dev/null)
  if [ -n "$status" ]; then
    echo "Pending changes in: $repodir"
    echo "$status"
    echo "-------------------"
  fi
done

echo "Scan complete. No pending changes found."
