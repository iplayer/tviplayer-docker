#!/bin/bash

set -e

sudo ln -sfn $PWD/host-serf-conf /etc/serf
sudo ln -sfn /etc/serf/serf.init.sh /etc/init.d/serf
sudo ln -sfn $PWD/tviplayer-node/serf-0.5.0 /usr/bin/serf

sudo /etc/init.d/serf start

./installDocker.sh
