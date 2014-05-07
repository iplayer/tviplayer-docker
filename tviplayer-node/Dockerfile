FROM tviplayer-sandbox 

ADD serf-0.5.0 /usr/bin/serf

ADD serfConfig.json /etc/serf/serf.json
ADD router.sh /etc/serf/router.sh
ADD handlers /etc/serf/handlers

ADD start_serf.sh /start_serf.sh

ENTRYPOINT /start_serf.sh
