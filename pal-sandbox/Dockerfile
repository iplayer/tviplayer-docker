FROM joshrp/centos59-base
MAINTAINER Josh Priestley <josh.priestley@bbc.co.uk>

# Directory setup
RUN mkdir -p /var/cache/tmp
RUN mkdir -p /etc/pki

# Base provisioning
RUN touch /etc/mtab
RUN rpm -ivh http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
RUN yum install -y curl git
RUN yum update -y
RUN yum reinstall -y glibc-common
RUN localedef -i en_GB -f UTF-8 en_GB.UTF-8

# Certificates
ADD certificates/ca.pem /etc/ca/ca.pem
ADD certificates/certificate.pem /etc/pki/certificate.pem
RUN mkdir -p /root/.yum
RUN ln -s /etc/pki/certificate.pem /root/.yum/dev.bbc.co.uk.pem
RUN ln -s /etc/pki/certificate.pem /root/.yum/dev.bbc.co.uk.key

# BBC Things
ADD bbc.repo /etc/yum.repos.d/bbc.repo
RUN yum install -y bbc-conf bbc-rpm-sandbox-base
RUN rm -f /etc/yum.repos.d/bbc.repo
RUN /usr/sbin/reithproxies off

ADD bbc.conf /etc/bbc.conf

RUN echo "NETWORKING=no" > /etc/sysconfig/network
# # BBC PAL
RUN yum install -y libpng bbc-pal-sandbox-packages || yum install -y bbc-pal-sandbox-packages # first one fails for non-fatal errors so running it again should return a zero exit code

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Node & Ruby
RUN yum install -y nodejs npm ruby19 rubygems
RUN echo "gem: --no-ri --no-rdoc" >> /etc/gemrc

EXPOSE 80
EXPOSE 81
EXPOSE 82
