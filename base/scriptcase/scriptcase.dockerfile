# comentário.
FROM centos:latest

# comentário.
RUN yum update -y
RUN yum upgrade -y
RUN yum install wget -y

# comentário.
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
RUN yum update -y

# comentário.
RUN dnf module install php:remi-7.3 -y
RUN yum install php-cli php-common php-bcmath php-gd php-json php-ldap php-mbstring php-soap php-xml php-zip php-mysql php-pgsql php-sqlite3 php-odbc -y

# comentário.
RUN yum install httpd -y

# comentário
RUN wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip
