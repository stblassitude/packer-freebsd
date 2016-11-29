#!/bin/sh

[ -f .envrc ] && . .envrc

ONLY=""
ONLY="${ONLY}${ONLY:+,}virtualbox-iso"
#ONLY="${ONLY}${ONLY:+,}vmware-iso"
#ONLY="${ONLY}${ONLY:+,}qemu"

function build() {
  FREEBSD=$1
  FREEBSD_VERSION=$2
  VERSION="${FREEBSD_VERSION}.$(date '+%Y%m%d')"
  DATE="$(date '+%Y-%m-%d')"


  packer build -only "${ONLY}" \
    -var "freebsd_rel=${FREEBSD}" \
    -var "freebsd_version=${FREEBSD_VERSION}" \
    -var "version=${VERSION}" \
    -var "date=${DATE}" \
    -var "HTTP_PROXY=${BOX_HTTP_PROXY}" \
    -var-file "freebsd-${FREEBSD}-vars.json" \
    template.json
}

set -ex

build 10 10.3

build 11 11.0
