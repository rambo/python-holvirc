#!/bin/bash

# Check that we can access docker
docker ps >/dev/null 2>&1
if [ "$?" != "0" ]
then
    echo "Can't access docker, maybe try 'sudo adduser `whoami` docker'"
    echo "You may need to logout and log in again for that to take effect"
    exit 1
fi

# "realpath" utility is not installed by default on all Linuxen and we need the true path
SCRIPTDIR=$(python2.7 -c 'import os,sys;print os.path.dirname(os.path.realpath(sys.argv[1]))' "$0")

# Make sure we're in the correct place relative to Dockerfile no matter where we were called from
cd `dirname "$SCRIPTDIR"`

# Check if image is already built
docker inspect --type=image holvirc_dev >/dev/null 2>&1
if [ "$?" != "0" ]
then
    set -e
    docker build -t holvirc_dev .
fi
set -e
if [ "$(docker ps -a -q -f name=holvirc_dev)" == "" ]
then
  echo "First run"
  set -x
	docker run --name holvirc_dev -it -v `pwd -P`:/opt/python-holvirc holvirc_dev
  set +x
else
  set -x
	docker start -i holvirc_dev
  set +x
fi
