#!/usr/bin/env sh

# This script update a given directory with git repositories from any host...

USERNAME="repos"

# Because the script is run as root with crond being a system daemon.
# We change access to "repos" user manualy. 

su - $USERNAME

REPO="~/git"

cd $REPO

for i in *; do
  cd "./$i"
  git pull
  if [ $? != 0 ]; then
    logger -s -p "cron.debug" "Something went wrong updating $REPO/$i."
  fi
  cd ..
done

exit 0

