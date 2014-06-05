#!/bin/bash
KEY=`cat ./serfCluster.key`
echo "KEY=$KEY"
+sudo -E docker.io run -d -p 8080:80 -p 8082:82 -e "HOSTSERFAGENT=172.17.42.1" -e "CLUSTERKEY=$KEY" --name sandbox-$1 tviplayer-node
