#!/bin/sh
set -ex

if zfs list -H -o name zroot; then
  zfs create -o compression=off -o sync=standard -o mountpoint=/var/tmp zroot/empty
fi
dd if=/dev/zero of=/var/tmp/EMPTY bs=1M || :
rm -f /var/tmp/EMPTY
zfs destroy zroot/empty || :
sync
sleep 30
sync
sleep 30
sync
