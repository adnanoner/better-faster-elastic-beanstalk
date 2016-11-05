#!/bin/bash
# Include envs
. /opt/elasticbeanstalk/env.vars

function error_exit
{
  eventHelper.py --msg "$1" --severity ERROR
  exit $2
}

#make sure node binaries can be found globally
if [ ! -L /usr/bin/node ]; then
  ln -s /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/node /usr/bin/node
fi

if [ ! -L /usr/bin/npm ]; then
  ln -s /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/npm /usr/bin/npm
fi

if [ ! -f "/opt/elasticbeanstalk/node-install/npm_updated" ]; then
  /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/npm install npm@$NPM_VER -g
  touch /opt/elasticbeanstalk/node-install/npm_updated
  echo "YAY! Updated global NPM version to `npm -v`"
else
  echo "Skipping NPM -g version update. To update, please uncomment 40install_node.sh:12"
fi
Raw
