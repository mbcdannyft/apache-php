FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade

RUN apt-get install apache2 mod_security
RUN apt-get install php5 libapache2-mod-php5 php5-mcrypt php5-mysql
RUN apt-get install wget

RUN apt-get clean

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
