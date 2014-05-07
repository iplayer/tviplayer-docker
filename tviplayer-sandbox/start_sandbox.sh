#!/bin/bash
service httpd restart
service sshd restart
service memcached restart

tail -f /var/log/httpd/error_log
