FROM alpine:3.18

RUN apk update && apk add nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=CA/ST=QC/L=Quebec/O=42 School/OU=inception/CN=inception"

COPY ./conf/default.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

RUN echo "Starting Nginx"

CMD ["nginx", "-g", "daemon off;"]