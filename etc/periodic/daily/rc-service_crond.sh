#!/usr/bin/env sh

# This script restart a particular daemon... using init script

DAEMON="crond"

rc-service $DAEMON restart

unset DAEMON

exit 0

