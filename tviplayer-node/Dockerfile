FROM tviplayer 

ADD host-serf-conf/serf-0.5.0 /usr/bin/serf

ADD serfConfig.json /etc/serf/serf.json
ADD router.sh /etc/serf/router.sh
ADD handlers /etc/serf/handlers

CMD serf agent -join $HOSTSERFAGENT -encrypt $CLUSTERKEY -config-file /etc/serf/serf.json


