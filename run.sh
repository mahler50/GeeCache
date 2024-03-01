#!/bin/bash
trap "rm server;kill 0" EXIT

go build -o server
./server -port=8101 &
./server -port=8102 &
./server -port=8103 -api=1 &

sleep 2
echo ">>> start test"
curl "http://localhost:9999/api?key=Tom" &
curl "http://localhost:9999/api?key=Tom" &
curl "http://localhost:9999/api?key=Tom" &

wait