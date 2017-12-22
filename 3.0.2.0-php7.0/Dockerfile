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

# CLEAN TMP FILES
RUN rm -rf tmp
RUN apt purge && apt-get autoremove -y && apt-get clean

# EXPOSE AND RUN
WORKDIR /var/www/html
EXPOSE 80 3306
CMD ["/run.sh"]