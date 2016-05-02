FROM centos:7

RUN apt-get update \
    && yum -y install epel-release \
    && yum -y install httpd mod_security \
    && yum -y install php php-devel php-pecl-redis php-pecl-zendopcache php-mysql \
    && yum -y install php-gd php-odbc php-pear php-xml php-mbstring php-snmp php-soap curl curl-devel \
    && yum clean all

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

