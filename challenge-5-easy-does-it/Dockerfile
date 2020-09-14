FROM nginx:alpine
EXPOSE $PORT
COPY bin/Debug/netstandard2.1/publish/wwwroot /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf.template /etc/nginx/nginx.conf.template
CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf" && nginx -g 'daemon off;'
