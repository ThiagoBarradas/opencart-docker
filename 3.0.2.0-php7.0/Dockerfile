FROM thiagobarradas/lamp:php-7.0
MAINTAINER Thiago Barradas <th.barradas@gmail.com>

# VARIABLES
ENV OPENCART_VERSION=3.0.2.0

# GET OPENCART FILES
WORKDIR /var/www/html
RUN rm -f * && mkdir tmp
WORKDIR /var/www/html/tmp
RUN ls -l
RUN wget -O opencart-$OPENCART_VERSION.zip https://codeload.github.com/opencart/opencart/zip/$OPENCART_VERSION
RUN chmod -R 755 /app

# UNZIP OPENCART
RUN unzip opencart-$OPENCART_VERSION.zip
WORKDIR /var/www/html/tmp/opencart-$OPENCART_VERSION
RUN composer install
RUN cp -a upload/. /var/www/html
COPY config/config.php /var/www/html/config.php
COPY config/admin-config.php /var/www/html/admin/config.php
RUN rm -f /var/www/html/config-dist.php 
RUN rm -f /var/www/html/admin/config-dist.php /var/www/html/admin/config.php
RUN mkdir /app-pvt && mkdir /app-pvt/storage 
RUN mv /app/system/storage/* /app-pvt/storage && chmod -R 777 /app-pvt/storage

# CLEAN TMP FILES
RUN rm -rf tmp
RUN apt purge && apt-get autoremove -y && apt-get clean

# COPY SCRIPT TO SETUP MAGENTO
COPY scripts/supervisord-zopencart.conf /etc/supervisor/conf.d/supervisord-zopencart.conf
COPY scripts/setup-opencart.sh /setup-opencart.sh

# EXPOSE AND RUN
RUN chmod -R 777 /var/www/html
WORKDIR /var/www/html
EXPOSE 80 3306
CMD ["/run.sh"]