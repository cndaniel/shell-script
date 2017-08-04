#!/bin/sh
# echo 'Hello' | sed 's/Hello/Hey/'

set -e
set -o pipefail

for file in services/*.service; do
  if grep -q port "$file" && grep -q name "$file"; then
    name=$(grep name "$file" | sed 's/name //')
    echo "$file $name" 
  fi
done
