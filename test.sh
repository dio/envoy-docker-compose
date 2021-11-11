#!/usr/bin/env bash

captured=$(docker run --network container:frontend \
  appropriate/curl -s \
  --write-out %{http_code} \
  --output /dev/null \
  --retry 10 \
  --retry-connrefused \
  http://localhost:10000)

if [ ${captured} -ne 200 ]; then
  exit 1
fi
