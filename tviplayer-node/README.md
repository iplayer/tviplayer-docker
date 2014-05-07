docker-serf-cluster
===================

Instalation
-----------

From fresh Ubuntu 13/14:
- `scripts/setupHost.sh`

Setup
-----
- `scripts/rebuild.sh`
- `export CLUSTERKEY=` + Grab key from `host-serf-conf/serf.json`
- `/etc/init.d/serf start`
- `scripts/spawnNew.sh 1`

You should have a running docker container with a serf member connected. Run `serf members` to see it.
