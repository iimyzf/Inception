FROM alpine:3.14

# Install nginx and openssl
RUN apk update && \
	apk add nginx openssl && \
    mkdir -p /run/nginx

# Create self-signed SSL certificate

RUN mkdir -p /etc/nginx/certs && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/server.key -out /etc/nginx/certs/server.crt -subj "/CN=yagnaou.42.fr"


COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf
# WORKDIR /var/www/html
# COPY ./index.html /var/www/html/index.html
# Copy nginx configuration file
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Expose ports
# EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
