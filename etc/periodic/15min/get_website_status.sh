#!/usr/bin/env sh

# This script gather status code from a given host and stores into /tmp/.

USERNAME="statuz"
HOSTNAME="https://google.com"

# we switch to an user to perform a request to the network with curl
su - $USERNAME

umask 022

# to avoid blocking in some cases, curl is throw as a job
# the status will appear in a file(.%hostname.report) into tmp.
curl --silent --output /dev/null --write-out "%{http_code}" $HOSTNAME > /tmp/".${HOSTNAME##*/}.report" &

exit 0
