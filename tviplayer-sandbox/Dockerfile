FROM pal-sandbox

RUN gem install bundle

# Setup git ssh key
ADD github-key.pem /etc/pki/github-key.pem
RUN chmod 600 /etc/pki/github-key.pem

ADD git-ssh.sh git-ssh.sh
RUN chmod +x git-ssh.sh
ENV GIT_SSH /git-ssh.sh

# Get repos
RUN git clone git@github.com:iplayer/responsive-web.git /mnt/hgfs/workspace/tviplayer
RUN git clone git@github.com:iplayer/bamboo.git /mnt/hgfs/workspace/bamboo
RUN git clone git@github.com:iplayer/tviplayerrouting.git /mnt/hgfs/workspace/tviplayerrouting

#Sandbox routing
RUN /mnt/hgfs/workspace/tviplayer/scripts/build/aws-sandbox/setup/moveStaticServePort.sh

# Install app grunt and app dependencies
RUN cd /mnt/hgfs/workspace/tviplayer && npm install && (./node_modules/.bin/grunt yum || true)

# Some random broken App dependencies
RUN yum install -y bbc-static-swfobject
RUN yum install -y bbc-pal-personalisation || true
RUN yum install -y bbc-static-share
RUN yum update -y --enablerepo=bbc-int bbc-pal-module

# App flagpoles for preview mode
RUN yum install -y bbc-annotate-flagpole-tviplayer
RUN flagctl --setvalue tviplayer/tviplayer-preview --input ON
RUN flagctl --setvalue tviplayer/tviplayer-rewrites --input ON

# Setup SSH access
RUN yum -y install openssh-server openssh-clients
# Nobble PAM which is broken for some reason in LXC
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

ADD host-key.pub /host-key.pub
RUN cat /host-key.pub >> /root/.ssh/authorized_keys

ADD start_sandbox.sh /start_sandbox.sh

ENTRYPOINT "/start_sandbox.sh"


