FROM nginxinc/nginx-unprivileged
USER root
RUN apt update && apt upgrade -y
USER nginx
RUN mkdir -p /etc/nginx/ssl
COPY default.conf /etc/nginx/conf.d/default.conf
USER root
RUN openssl genrsa -out /etc/ssl/test.com.key 2048
RUN printf 'ES\n\n\n\n\nclient'$n'\n\n\n\n' | openssl req -new -x509 -key /etc/ssl/test.com.key -out /etc/ssl/test.com.crt -days 365
RUN chown -R nginx:nginx /etc/nginx/conf.d/
RUN chown -R nginx:nginx /etc/ssl/
RUN chown -R nginx:nginx /usr/share/nginx/html
RUN chown -R nginx:nginx /var/cache/nginx /var/log/nginx
USER nginx

EXPOSE 8080 8443
CMD ["nginx", "-g", "daemon off;"]

