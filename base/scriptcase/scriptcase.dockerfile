# comentário.
FROM centos:latest

# comentário.
RUN yum update -y
RUN yum upgrade -y
RUN yum install curl -y
RUN yum install sudo -y
RUN yum install wget -y
RUN yum install httpd -y
RUN yum update -y

# comentário.
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
RUN yum update -y

# comentário.
RUN dnf module install php:remi-7.3 -y
RUN yum install php-cli php-common php-bcmath php-gd php-json php-ldap php-mbstring php-soap php-xml php-zip php-mysql php-pgsql php-sqlite3 php-odbc -y

# comentário
RUN curl -O https://downloads.scriptcase.com.br/downloads/v9/packs/scriptcase-9.4.031-pt_br-php7.3.zip
RUN curl -O https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip

# comentário.
EXPOSE 80
EXPOSE 443

# comentário.
CMD ["/script/httpd.sh"]
