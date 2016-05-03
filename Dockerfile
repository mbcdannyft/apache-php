FROM ubuntu:14.04

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install apache2 libapache2-modsecurity libapache2-mod-evasive libapache2-mod-cloudflare
RUN apt-get -y install php5 libapache2-mod-php5 php5-mcrypt php5-mysql
RUN apt-get -y install wget

RUN apt-get clean

COPY 01-security.ini /etc/php5/apache2/conf.d/
COPY security.conf /etc/apache2/conf-available/

RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod mod-evasive

ENV MYSQLI_DEFAULT_PORT null
ENV MYSQLI_DEFAULT_HOST null
ENV MYSQLI_DEFAULT_USER null
ENV MYSQLI_DEFAULT_PASSWORD null

RUN echo "mysqli.default_port = $MYSQLI_DEFAULT_PORT"     >  /etc/php5/apache2/conf.d/02-mysqli-defaults.ini
RUN echo "mysqli.default_host = $MYSQLI_DEFAULT_HOST"     >> /etc/php5/apache2/conf.d/02-mysqli-defaults.ini
RUN echo "mysqli.default_user = $MYSQLI_DEFAULT_USER"     >> /etc/php5/apache2/conf.d/02-mysqli-defaults.ini
RUN echo "mysqli.default_pw   = $MYSQLI_DEFAULT_PASSWORD" >> /etc/php5/apache2/conf.d/02-mysqli-defaults.ini

ENV REMOVE_RULES NONE

COPY setup.py /tmp/
CMD python3 /tmp/setup.py
CMD rm /tmp/setup.py

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
