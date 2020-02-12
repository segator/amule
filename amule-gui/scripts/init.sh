#!/bin/sh

x11vnc -storepasswd $VNC_PASS /etc/vncsecret
chmod 444 /etc/vncsecret

echo "Running virtual desktop..."
/usr/bin/supervisord -n &
sleep 2
AMULE_HOME=/app
REMOTE_CONF=${AMULE_HOME}/remote.conf
AMULE_PWD=$(echo -n "${AMULE_PWD}" | md5sum | cut -d ' ' -f 1)
cat > ${REMOTE_CONF} <<- EOM
Locale=
[EC]
Host=${AMULE_HOST}
Port=${AMULE_PORT}
Password=${AMULE_PWD}
EOM
amulegui -c ${AMULE_HOME} -o
