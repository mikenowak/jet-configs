#!/sbin/sh
# This script sets up the default process scheduler class to
# FAIR SHARE SCHEDULE, and assignes 25 shares to the global zone.
#
# Please do not assign more than 20 shares to any non global zone
#
/usr/sbin/dispadmin -d FSS
/usr/sbin/zonecfg -z global set cpu-shares=25
