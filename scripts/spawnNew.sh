#!/bin/bash
echo "Key=$CLUSTERKEY"
docker run -d -p 8080:80 -p 8082:82 -e "HOSTSERFAGENT=172.17.42.1" -e "CLUSTERKEY=$CLUSTERKEY" --name sandbox-$1 tviplayer-node
