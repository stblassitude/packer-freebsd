#!/bin/sh

[ -f .envrc ] && . .envrc

ONLY=""
ONLY="${ONLY}${ONLY:+,}virtualbox-iso"
#ONLY="${ONLY}${ONLY:+,}vmware-iso"
#ONLY="${ONLY}${ONLY:+,}qemu"

VERSION="11.0.$(date '+%Y%m%d')"
DATE="$(date '+%Y-%m-%d')"

set -x
packer build -only "${ONLY}" \
  -var "version=${VERSION}" \
  -var "date=${DATE}" \
  -var "HTTP_PROXY=${BOX_HTTP_PROXY}" \
  freebsd-11.json
