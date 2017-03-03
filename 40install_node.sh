#!/bin/bash

# NPM_VER=3.10.8
ARCH=x64

if [ -z "$1" ]; then
	# No specific version defined
	NODE_VER=7.7.1
else
	NODE_VER=$1
fi

#make sure node binaries can be found globally
if [ ! -L /usr/bin/node ]; then
  ln -s /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/node /usr/bin/node
fi

# function error_exit
# {
#   eventHelper.py --msg "$1" --severity ERROR
#   exit $2
# }
# 
#download and extract desired node.js version 
echo "checking node..."
OUT=$( [ ! -d "/opt/elasticbeanstalk/node-install" ] && echo "trying to install node.js $NODE_VER"   && mkdir /opt/elasticbeanstalk/node-install ; cd /opt/elasticbeanstalk/node-install/ && \
  wget -nc http://nodejs.org/dist/v$NODE_VER/node-v$NODE_VER-linux-$ARCH.tar.gz && \
  tar --skip-old-files -xzpf node-v$NODE_VER-linux-$ARCH.tar.gz) || error_exit "Failed to UPDATE node version. $OUT" $?.
echo $OUT

#make sure node binaries can be found globally
if [ ! -L /usr/bin/node ]; then
  ln -s /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/node /usr/bin/node
fi

# if [ ! -f "/opt/elasticbeanstalk/node-install/npm_updated" ]; then
#   /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/npm install npm@$NPM_VER -g
#   touch /opt/elasticbeanstalk/node-install/npm_updated
#   echo "YAY! Updated global NPM version to `npm -v`"
# else
#   echo "Skipping NPM -g version update. To update, please uncomment 40install_node.sh:12"
# fi