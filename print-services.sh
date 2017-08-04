#!/bin/sh
# echo 'Hello' | sed 's/Hello/Hey/'

set -e
set -o pipefail

for file in services/*.service; do
  if grep -q port $file; then
    echo "$file" 
  fi
done
