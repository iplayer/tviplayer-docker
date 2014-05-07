#!/bin/sh
 
### BEGIN INIT INFO
# Provides:   serf
# Required-Start:    $local_fs $remote_fs $network $syslog $named
# Required-Stop:     $local_fs $remote_fs $network $syslog $named
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the serf agent
# Description:       starts serf agent using start-stop-daemon
### END INIT INFO
 
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/usr/bin/serf
DAEMON_OPTS="agent -config-dir=/etc/serf"
NAME=serf
DESC=serf
 
# Include serf defaults if available
if [ -f /etc/default/serf ]; then
    . /etc/default/serf
fi
 
test -x $DAEMON || exit 0
 
set -e
 
. /lib/lsb/init-functions
 
PID=$(awk -F'[ ;]' '/[^#]pid/ {print $2}' /etc/serf/serf.json)
if [ -z "$PID" ]
then
  PID=/run/serf.pid
fi
 
# Check if the ULIMIT is set in /etc/default/serf
if [ -n "$ULIMIT" ]; then
  # Set the ulimits
  ulimit $ULIMIT
fi
 
start() {
	echo "PID: $PID"
        start-stop-daemon --start --background -m --pidfile $PID \
            --retry 5 --exec $DAEMON --oknodo -- $DAEMON_OPTS > /var/log/serf.log
}
 
stop() {
        start-stop-daemon --stop --quiet --pidfile $PID \
            --retry 5 --oknodo --exec $DAEMON > /var/log/serf.log
}
 
case "$1" in
    start)
        log_daemon_msg "Starting $DESC" "$NAME"
        start
        log_end_msg $?
        ;;
 
    stop)
        log_daemon_msg "Stopping $DESC" "$NAME"
        stop
        log_end_msg $?
        ;;
 
    restart|force-reload)
        log_daemon_msg "Restarting $DESC" "$NAME"
        stop
        sleep 1
        start
        log_end_msg $?
        ;;
 
    reload)
        log_daemon_msg "Reloading $DESC configuration" "$NAME"
        start-stop-daemon --stop --signal HUP --quiet --pidfile $PID \
            --oknodo --exec $DAEMON
        log_end_msg $?
        ;;
 
    status)
        status_of_proc -p $PID "$DAEMON" serf
        ;;
 
    *)
        echo "Usage: $NAME {start|stop|restart|reload|force-reload|status}" >&2
        exit 1
        ;;
esac
 
exit 0
