FROM tviplayer-node

RUN yum update -y

RUN cd /mnt/hgfs/workspace/tviplayer && git fetch origin && git checkout origin/develop

#Sandbox routing
RUN /mnt/hgfs/workspace/tviplayer/scripts/build/aws-sandbox/setup/moveStaticServePort.sh



