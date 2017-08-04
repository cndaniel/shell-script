#!/bin/sh
echo 'Hello' | sed 's/Hello/Hey/'

set -e
set -o piplefail
