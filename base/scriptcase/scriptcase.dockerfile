# comentário.
FROM centos:latest

# comentário.
RUN yum update -y && yum upgrade -y
RUN yum install curl sudo wget httpd unzip policycoreutils selinux-policy-targeted -y
RUN yum update -y

# comentário.
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
RUN yum update -y

# comentário.
RUN dnf module install php:remi-7.3 -y
RUN yum install php-cli php-common php-bcmath php-gd php-json php-ldap php-mbstring php-soap php-xml php-zip php-mysql php-pgsql php-sqlite3 php-odbc -y

# comentário.
COPY config/php.ini /etc/
COPY app/app.php /var/www/html/

# comentário
RUN curl -O https://downloads.scriptcase.com.br/downloads/v9/packs/scriptcase-9.4.031-pt_br-php7.3.zip
RUN curl -O https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip
RUN chmod 777 scriptcase-9.4.031-pt_br-php7.3.zip
RUN chmod 777 ioncube_loaders_lin_x86-64.zip
RUN unzip scriptcase-9.4.031-pt_br-php7.3.zip
RUN unzip ioncube_loaders_lin_x86-64.zip
RUN mv ioncube/* /usr/lib64/php/modules
RUN mv scriptcase-9.4.031-pt_br-php7.3 scriptcase
RUN mv scriptcase /var/www/html/
RUN rm *.zip && rm -R ioncube

# comentário.
EXPOSE 80
EXPOSE 443

# comentário.
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
