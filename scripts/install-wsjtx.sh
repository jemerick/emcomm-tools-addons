#!/usr/bin/env bash
#
# Author  : Jason Emerick
# Date    : 20 FEB 2026
# Updated : 20 FEB 2026
# Purpose : Installs WSJT-X-Improved https://wsjt-x-improved.sourceforge.io

WSJTX_URL="https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v2.8.0/Linux/wsjtx_2.8.0_improved_PLUS_250501_amd64.deb"
TMP_FILE="/tmp/wsjtx-tmp.deb"

# Load env
source /etc/environment

set -e 

et-log "Installing WSJT-X..."

wget --verbose --output-document=$TMP_FILE $WSJTX_URL
apt install $TMP_FILE
rm $TMP_FILE

cp -v ../overlay/opt/emcomm-tools/conf/template.d/WSJT-X.conf ${ET_HOME}/conf/template.d/WSJT-X.conf
chmod -v 664 ${ET_HOME}/conf/template.d/WSJT-X.conf

cp -v ../overlay/opt/emcomm-tools/bin/et-wsjtx ${ET_HOME}/bin/et-wsjtx
chmod -v 664 ${ET_HOME}/bin/et-wsjtx

cp -v ../overlay/usr/share/applications/wsjtx.desktop /usr/share/applications/
