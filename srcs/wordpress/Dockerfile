FROM alpine:3.18

RUN apk update && \
    apk add --no-cache curl php82 php82-cgi php82-mysqli php82-pdo_mysql php82-fpm php82-phar php82-json php82-mbstring php82-curl php82-openssl mysql-client && \
    rm -f /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN ln -s /usr/bin/php82 /usr/bin/php

RUN mkdir -p /var/www/html \
	&& chown -R nobody:nobody /var/www/html \
    && chown -R nobody:nobody /var/www

RUN chmod -R 755 /var/www/html

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

COPY entrypoint.sh /var/www/entrypoint.sh

RUN chmod +x /var/www/entrypoint.sh

RUN mkdir -p /run/php

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/var/www/entrypoint.sh"]