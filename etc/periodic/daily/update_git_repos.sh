#!/usr/bin/env sh

# This script update a given directory with git repositories from any host...
# Because the script is run as root with crond being a system daemon.
# We change access to "repos" user manualy. no password is required.

USERNAME="repos"

su - $USERNAME

REPO="~/git"

cd $REPO

for i in *; do
  cd "./$i"
  git pull
  if [ $? != 0 ]; then
    logger -s -p "cron.debug" "$0:Something went wrong updating $REPO/$i."
  fi
  cd ..
done

unset REPO USERNAME

exit 0

