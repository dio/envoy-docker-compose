#!/usr/bin/env bash

docker run --network container:frontend \
  appropriate/curl -s \
  --retry 10 \
  --retry-connrefused \
  -I \
  http://localhost:10000

captured=$(docker run --network container:frontend \
  appropriate/curl -s \
  --retry 10 \
  --retry-connrefused \
  -I \
  http://localhost:10000 | grep 'HTTP/1.1 200 OK' | xargs)

echo ${captured}

if [ "$captured" != "HTTP/1.1 200 OK" ]; then
  exit 1
fi
