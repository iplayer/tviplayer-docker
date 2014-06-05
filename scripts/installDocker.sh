#!/bin/bash

set -e

sudo apt-get update

# Uncomment the following to have docker installed into /mnt instead (more disk space?)
#mkdir -p /var/lib/docker
#mount -M /mnt /var/lib/docker || true

sudo apt-get update
sudo apt-get -y install docker.io


