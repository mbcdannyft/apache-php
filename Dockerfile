FROM ubuntu:14.04

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install apache2 libapache2-modsecurity
RUN apt-get -y install php5 libapache2-mod-php5 php5-mcrypt php5-mysql
RUN apt-get -y install wget

RUN apt-get clean

COPY 01-security.ini /etc/php5/apache2/conf.d/
COPY security.conf /etc/apache2/conf-available/

RUN echo '<?php phpinfo();' > /var/www/html/index.php

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
