FROM pal-sandbox

RUN gem install bundle

# Setup git ssh key
ADD github-key.pem /etc/pki/github-key.pem
RUN chmod 600 /etc/pki/github-key.pem

ADD git-ssh.sh git-ssh.sh
RUN chmod +x git-ssh.sh
ENV GIT_SSH /git-ssh.sh

# Some random broken App dependencies
RUN yum install -y bbc-static-swfobject
RUN yum install -y bbc-pal-personalisation || true
RUN yum install -y bbc-static-share
RUN yum update -y --enablerepo=bbc-int bbc-pal-module

# App flagpoles for preview mode
RUN yum install -y bbc-annotate-flagpole-tviplayer
RUN yum install -y bbc-pal-service-kvstore || true

# Get repos
RUN git clone git@github.com:iplayer/responsive-web.git /mnt/hgfs/workspace/tviplayer
RUN git clone git@github.com:iplayer/tviplayerrouting.git /mnt/hgfs/workspace/tviplayerrouting

RUN cd /mnt/hgfs/workspace/tviplayer && npm install
RUN cd /mnt/hgfs/workspace/tviplayer && (./node_modules/.bin/grunt yum || true)
RUN cd /mnt/hgfs/workspace/tviplayer && ./node_modules/.bin/grunt exec:composer

ENTRYPOINT ["bash", "-c"]
