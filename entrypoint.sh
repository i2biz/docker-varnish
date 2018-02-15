#!/usr/bin/env bash
set -e

cmd="$@"

echo ${VARNISH_ACL_CONFIG} | base64 -d > /etc/varnish.vcl

exec "${cmd}"
