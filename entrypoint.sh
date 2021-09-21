#!/usr/bin/env bash

PATH=$PATH:/app/env/bin
cd /app
uwsgi --ini wsgi.ini
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -p /run/haproxy.pid
exec "$@"
