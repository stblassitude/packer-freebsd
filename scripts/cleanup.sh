#!/bin/sh
set -ex
pkg autoremove -y
pkg clean -y
rm -f /root/VBoxGuestAdditions.iso || true
sed -i '' -e '/^PermitRootLogin/d' /etc/ssh/sshd_config
rm -rf /var/db/freebsd-update/files
mkdir /var/db/freebsd-update/files
rm -f /var/db/freebsd-update/*-rollback
rm -rf /var/db/freebsd-update/install.*
rm -f /var/db/dhclient.leases.*
rm -f /var/db/pkg/*FreeBSD*
rm -rf /boot/kernel.old
rm -f /boot/kernel/*.symbols
rm -f /*.core
rm -rf /tmp/*
