#!/bin/bash

/start_sandbox.sh

serf agent -join $HOSTSERFAGENT -encrypt $CLUSTERKEY -config-file /etc/serf/serf.json
