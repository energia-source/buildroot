#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "$0: is not running as root. Aborting."
  exit 1
fi

runner() {
    echo "Stop this container."
    exit 0;
}

trap runner SIGINT SIGQUIT SIGTERM
while true; do
  sleep 32 & wait $!
done
