FROM centos:6

MAINTAINER rtryoda

# PostgreSQL
RUN yum -y localinstall http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-1.noarch.rpm 
RUN yum -y install postgresql94-server
RUN service postgresql-9.4 initdb
COPY conf/postgresql.conf /var/lib/pgsql/9.4/data/
COPY conf/pg_hba.conf /var/lib/pgsql/9.4/data/
RUN  chown -R postgres:postgres /var/lib/pgsql/9.4/data/

# supervisor
RUN yum -y install python-setuptools
RUN easy_install supervisor
COPY conf/supervisord.conf /etc/

EXPOSE 5432
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

