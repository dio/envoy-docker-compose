#!/usr/bin/env bash

captured=$(docker run --network container:frontend \
  appropriate/curl -s \
  --retry 10 \
  --retry-connrefused \
  -I \
  http://localhost:10000 | grep 'HTTP/1.1 200 OK')

if [ "$captured" != "HTTP/1.1 200 OK" ]; then
  exit 1
fi
