#!/bin/sh
# echo 'Hello' | sed 's/Hello/Hey/'

set -e
set -o pipefail

if [ $# -eq 0 ]; then
  echo "Please provide the name of the services directory."
  # exit
  exit 64
fi

print_services(){
  if grep -q port "$1" && grep -q name "$1"; then
    name=$(grep name "$1" | sed 's/name //')
    port=$(grep port "$1" | sed 's/port //')
    if [ "$port" -lt 5000 ]; then
      echo "Port is under 5000."
    fi
    echo "In $1, we're running  $name on $port"
  else
    echo "$1 does not have a name or a port."
  fi
}

for file in "$1"/*.service; do
  print_services "$file"
done

