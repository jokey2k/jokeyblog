#!/bin/bash

# NOTE: updated to use my Match exec patch, inverted exit codes!!!

# based on script from http://www.axllent.org/docs/view/ssh-geoip
# License: WTFPL

###############################################################################

# UPPERCASE space-separated country codes to ACCEPT
ALLOW_COUNTRIES="DE CH"

# sometimes IPv6 adresses have bad country allocation, so allow more...
ALLOW_COUNTRIES_V4="$ALLOW_COUNTRIES AT"
ALLOW_COUNTRIES_V6="$ALLOW_COUNTRIES AT EU GB"

LOGALLOW_FACILITY="authpriv.notice"
LOGDENY_FACILITY="authpriv.notice"

# we have to look like sshd produced msgs so fail2ban is happy
LOGGER_NAME="sshd"

###############################################################################

if [ $# -ne 1 ]; then
  echo "Usage:  `basename $0` <ip>" 1>&2
  # Return OK to sshd in case of wrong usage
  exit 1
fi

RESPONSE="DENY"
if [[ "`echo $1 | grep ':'`" != "" ]] ; then
    COUNTRY=`/usr/bin/geoiplookup6 $1 | awk -F ": " '{ print $2 }' | awk -F "," '{ print $1 }' | head -n 1`
    [[ $COUNTRY = "IP Address not found" || $ALLOW_COUNTRIES_V6 =~ $COUNTRY ]] && RESPONSE="ALLOW"
else
    COUNTRY=`/usr/bin/geoiplookup $1 | awk -F ": " '{ print $2 }' | awk -F "," '{ print $1 }' | head -n 1`
    [[ $COUNTRY = "IP Address not found" || $ALLOW_COUNTRIES_V4 =~ $COUNTRY ]] && RESPONSE="ALLOW"
fi

if [[ "$RESPONSE" == "ALLOW" ]] ; then
  logger -i -t $LOGGER_NAME -p $LOGALLOW_FACILITY "$RESPONSE sshd connection from $1 ($COUNTRY)"
  exit 1
else
  logger -i -t $LOGGER_NAME -p $LOGDENY_FACILITY "$RESPONSE sshd connection from $1 ($COUNTRY)"
  exit 0
fi
