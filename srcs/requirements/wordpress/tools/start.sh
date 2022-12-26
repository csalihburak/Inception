#!/bin/sh
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

    echo $DB_NAME
    wp core download --allow-root
    wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST  
    echo "wp-config.php file updated successfully!"
    wp core install --url=scoskun.42.fr --title="Docker 42 WordPress" \
    --admin_user=$DB_USER --admin_password=$DB_PASS \
    --admin_email=csalihburak@gmail.com
    wp theme install twentyseventeen --activate

fi

exec "$@"
