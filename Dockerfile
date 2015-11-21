FROM centos:centos6

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

