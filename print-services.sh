#!/bin/sh
# echo 'Hello' | sed 's/Hello/Hey/'

set -e
set -o pipefail

for file in services/*.service; do
  if grep -q port "$file" && grep -q name "$file"; then
    name=$(grep name "$file" | sed 's/name //')
    port=$(grep port "$file" | sed 's/port //')
    if [ "$port" -lt 5000 ]; then
      echo "Port is under 5000."
    fi
    echo "In $file, we're running  $name on $port"
  else
    echo "$file does not have a name or a port."
  fi
done
