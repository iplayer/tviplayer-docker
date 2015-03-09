FROM pal-sandbox

RUN gem install bundle

# Some random broken App dependencies
RUN yum install -y bbc-static-swfobject
RUN yum install -y bbc-pal-personalisation || true
RUN yum install -y bbc-static-share
RUN yum update -y --enablerepo=bbc-int bbc-pal-module

# App flagpoles for preview mode
RUN yum install -y bbc-annotate-flagpole-tviplayer
RUN yum install -y bbc-pal-service-kvstore || true

# Get repos
ADD ./repos/responsive-web /mnt/hgfs/workspace/tviplayer
ADD ./repos/tviplayerrouting /mnt/hgfs/workspace/tviplayerrouting

RUN cd /mnt/hgfs/workspace/tviplayer && npm install
RUN cd /mnt/hgfs/workspace/tviplayer && (./node_modules/.bin/grunt yum || true)
RUN cd /mnt/hgfs/workspace/tviplayer && ./node_modules/.bin/grunt exec:composer

ENTRYPOINT ["bash", "-c"]

