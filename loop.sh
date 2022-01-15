#!/bin/sh

trap "stop_gracefully" TERM
LOOP=1

stop_gracefully () {
  echo "Stopping gracefully, bye!"
  LOOP=0
}

while [ "$LOOP" = "1" ]
do
  sleep 1
done
