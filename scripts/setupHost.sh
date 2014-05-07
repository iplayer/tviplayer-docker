#!/bin/bash

set -e

sudo ln -s {$PWD}/host-serf-conf /etc/serf
sudo ln -s /etc/serf/serf.init.sh /etc/init.d/serf
sudo ln -s /etc/serf/serf-0.5.0 /usr/bin/serf

./installDocker.sh
