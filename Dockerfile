FROM centos:7

RUN apt-get update \
    && yum -y install httpd \
    && yum -y install php \
    && yum -y install php-gd php-ldap php-odbc php-pear \
    && yum -y install php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel
    && yum clean all

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

