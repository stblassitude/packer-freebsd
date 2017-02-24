#!/bin/sh

set -x

if zfs list -H -o name zroot; then
  zfs create -o compression=off -o sync=standard -o mountpoint=/var/tmp zroot/empty
fi

# it appears dd can hang when the dataset is full, so monitor free space
timeout 15m dd if=/dev/zero of=/var/tmp/EMPTY bs=1M & pid=$!
while :; do
  df -m /var/tmp; sleep 2
  df -m /var/tmp | awk '/\/var\/tmp/ { if ($4 < 5) exit 0; else exit 1;}' && break
  [ -e /proc/$pid ] || break
  sleep 5
done
kill $pid

rm -f /var/tmp/EMPTY
zfs destroy zroot/empty
sync
sleep 5
sync
sleep 5
sync
