#!/bin/bash

set -e

sudo docker.io build -t pal-sandbox ./pal-sandbox/

sudo docker.io build -t tviplayer-sandbox ./tviplayer-sandbox/

sudo docker.io build -t tviplayer-node ./tviplayer-node/


