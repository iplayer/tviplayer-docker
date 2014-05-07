#!/bin/sh
exec /usr/bin/ssh -o StrictHostKeyChecking=no -i /etc/pki/github-key.pem "$@"
