sleep 30

mysqladmin create opencart 
mysqladmin -u root password Temp123
php /app/install/cli_install.php install --db_hostname localhost --db_username root --db_password Temp123 --db_database opencart --db_driver mysqli --username $ADMIN_USERNAME --password $ADMIN_PASSWORD --email $ADMIN_EMAIL --http_server http://localhost/
mysqladmin -u root -pTemp123 password ""
rm -f /app/config.php
mv /app/_config.php /app/config.php
rm -f /app/admin/config.php
mv /app/admin/_config.php /app/admin/config.php
mkdir /app-pvt && mkdir /app-pvt/storage 
mv /app/system/storage/* /app-pvt/storage
rm -rf /app/install

chmod -R 777 /app /app-pvt
rm -f /etc/supervisor/conf.d/supervisord-zopencart.conf