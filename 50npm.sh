#!/bin/bash
# Include envs
. /opt/elasticbeanstalk/env.vars

if [ ! -f "/opt/elasticbeanstalk/node-install/npm_updated" ]; then
  /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/npm install npm@$NPM_VER -g
  touch /opt/elasticbeanstalk/node-install/npm_updated
  echo "YAY! Updated global NPM version to `npm -v`"
else
  echo "Skipping NPM -g version update. To update, please uncomment 40install_node.sh:12"
fi