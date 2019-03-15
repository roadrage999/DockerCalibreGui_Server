#!/bin/bash
set -ex

RUN_FLUXBOX=${RUN_FLUXBOX:-yes}
RUN_XTERM=${RUN_XTERM:-yes}
RUN_CALIBRE=${RUN_CALIBRE:-yes}

case $RUN_FLUXBOX in
  false|no|n|0)
    rm -f /app/conf.d/fluxbox.conf
    ;;
esac

case $RUN_XTERM in
  false|no|n|0)
    rm -f /app/conf.d/xterm.conf
    ;;
esac

case $RUN_CALIBRE in
  false|no|n|0)
    rm -f /app/conf.d/calibre.conf
    ;;
esac

exec supervisord -c /app/supervisord.conf
