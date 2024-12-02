#!/usr/bin/env sh

# This script gather status code from a given host and stores into /tmp/.

USERNAME="statuz"
HOSTNAME="https://google.com"

# we switch to an user to perform a request to the network with curl
su - $USERNAME

umask 022

# to avoid blocking in some cases, curl is thrown as a job
# the status will appear in a file(.%hostname.report) into tmp.
curl -A "HelloItsMe" -I -s -o /dev/null -w "%{http_code}" -L $HOSTNAME > /tmp/".${HOSTNAME##*/}.report" &

unset USERNAME HOSTNAME

exit 0
