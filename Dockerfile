FROM centos:6

MAINTAINER rtryoda

# PostgreSQL
RUN yum -y localinstall http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-1.noarch.rpm 
RUN yum -y install postgresql94-server

# supervisor
RUN yum -y install python-setuptools
RUN easy_install supervisor
COPY supervisord.conf /etc/

EXPOSE 5432
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

