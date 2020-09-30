# comentário.
FROM debian:latest

# comentário.
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install apache2
RUN apt-get -y install lsb-release apt-transport-https ca-certificates
RUN apt-get -y curl sudo wget unzip

# comentário.
ADD ./config/000-default.conf /etc/apache2/sites-available/000-default.conf
ADD ./config/start.sh /bootstrap/start.sh
RUN chmod 755 /bootstrap/start.sh && chown -R www-data:www-data /var/www/html

# comentário.
EXPOSE 80
EXPOSE 443

# comentário.
ENTRYPOINT["/bootstrap/start.sh"]
