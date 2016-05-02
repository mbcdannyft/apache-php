FROM centos:7

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install httpd mod_security
RUN yum -y install php php-devel php-pecl-redis php-pecl-zendopcache php-mysql
RUN yum -y install php-gd php-odbc php-pear php-xml php-mbstring php-snmp php-soap curl curl-devel
RUN yum clean all

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
