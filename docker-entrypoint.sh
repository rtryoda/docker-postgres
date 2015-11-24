#!/bin/bash
service postgresql-9.4 initdb
/usr/bin/supervisord -c /etc/supervisord.conf

