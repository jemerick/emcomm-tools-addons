#!/bin/bash
#
# Author  : Jason Emerick
# Date    : 20 FEB 2026
# Updated : 20 FEB 2026
# Purpose : Instal QDX radio support
set -e

et-log "Installing QDX radio support"

source /etc/environment

cp -v ../overlay/etc/udev/rules.d/87-et-qrplabs-qdx.rules /etc/udev/rules.d/

cp -v ../overlay/opt/emcomm-tools/conf/radios.d/qrplabs-qdx.json $ET_HOME/conf/radios.d

chgrp -v $ET_GROUP $ET_HOME/conf/radios.d/qrplabs-qdx.json
chmod -v 664 $ET_HOME/conf/radios.d/qrplabs-qdx.json
