FROM nginx:latest

MAINTAINER Larry Eitel <larry@eitel.com>

# ADD default.conf /etc/nginx/conf.d
ADD nginx.conf /etc/nginx/
COPY sites/* /etc/nginx/sites-available/

RUN echo "upstream php-upstream { server php-fpm:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80 443
