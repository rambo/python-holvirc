#! /bin/bash

if [ -e /tmp/.X99-lock ]
then
    rm /tmp/.X99-lock
fi

Xvfb :99 -screen 0 1600x1200x16 &
XVFB_PID=$!
export DISPLAY=:99

VENV_DIR_PATH=/opt/holvirc-venv

# activate virtualenv
. $VENV_DIR_PATH/bin/activate

# drop to shell or execute whatever was requested
if [ "$#" -eq 0 ]; then
  /usr/bin/env /bin/bash
else
  echo "Calling $@"
  /usr/bin/env "$@"
fi

# Kill the framebuffer
kill $XVFB_PID
