FROM centos:7

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install httpd
RUN yum -y install mod_security
RUN yum -y install php
RUN yum -y install php-devel
RUN yum -y install php-pecl-redis
RUN yum -y install php-pecl-zendopcache
RUN yum -y install php-mysql
RUN yum -y install php-gd
RUN yum -y install php-odbc
RUN yum -y install php-pear
RUN yum -y install php-xml
RUN yum -y install php-mbstring
RUN yum -y install php-snmp
RUN yum -y install php-soap
RUN yum -y install curl
RUN yum -y install curl-devel
RUN yum clean all

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
