#!/bin/bash
TARGETS=" -f docker-compose.yml"
DEFAULTS="sote kymp hallinto kasko elo"

if [ -n "$1" ]; then
  DEFAULTS="$@"
fi

for TARGET in $DEFAULTS
do
  if [ -f "$TARGET.yml" ]; then
    echo "Starting: ${TARGET}"
    TARGETS="${TARGETS} -f ${TARGET}.yml"
  fi
done

docker compose $TARGETS up
