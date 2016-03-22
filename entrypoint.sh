#!/bin/sh

# Expects a userid number in the environment variable USERID

WEBSITE=/var/local/website
OWNER="${USERID:-600}"
INITIALADMIN="${INITIALADMIN:-admin:firsttime}"

id -u zope 2>/dev/null && userdel zope
useradd -u "$OWNER" zope

if [ ! -f $WEBSITE/etc/zope.conf ]; then
   /var/local/zope/bin/mkzopeinstance.py -d $WEBSITE -u "${INITIALADMIN}"
   chown -R "$OWNER" $WEBSITE
fi

/bin/su zope -c "$WEBSITE/bin/zopectl fg"

