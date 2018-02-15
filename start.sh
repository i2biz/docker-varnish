#!/bin/bash

set -e

exec bash -c "exec varnishd -F -u varnish -f /etc/varnish.vcl -s malloc,${VARNISH_CACHE_SIZE} ${VARNISH_VARNISHD_PARAMS}"
