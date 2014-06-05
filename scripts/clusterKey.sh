#!/bin/bash

if [[ $# == 0 ]]; then
        KEY=`serf keygen`
else
        KEY="$1"
fi
sed "s@\"encrypt_key\": \"[^\"]*\"@\"encrypt_key\": \"$KEY\"@" /etc/serf/serf.json -i
echo "$KEY" > ./serfCluster.key
sudo /etc/init.d/serf restart
