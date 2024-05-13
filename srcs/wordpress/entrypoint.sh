#!/bin/sh


if [ -f ./wp-config.php ]
then
	echo "Wordpress already installed."
else
	wp core download --allow-root;
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root;
	wp core install --url="http://$DOMAIN_NAME/" --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root;
	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD --allow-root;
fi

echo "Starting Wordpress"
exec /usr/sbin/php-fpm82 -F