#!/bin/bash

set -e

docker.io build -t pal-sandbox ./pal-sandbox/

docker.io build -t tviplayer-sandbox ./tviplayer-sandbox/

docker.io build -t tviplayer-node ./tviplayer-node/


