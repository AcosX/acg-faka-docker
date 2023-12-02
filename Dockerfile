FROM php:8.3-apache
RUN apt update
RUN apt install -y mariadb-server
# 设置MariaDB root密码
ENV MYSQL_ROOT_PASSWORD=123456
# 启动 MariaDB 服务
RUN service mariadb start && mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}" && mariadb -u root -p -e "CREATE DATABASE acg;"
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libzip-dev
RUN docker-php-ext-install gd pdo_mysql zip
RUN a2enmod rewrite
EXPOSE 80
