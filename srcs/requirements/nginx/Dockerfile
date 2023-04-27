FROM alpine:3.14

# Install nginx and openssl
RUN apk update && \
	apk add nginx openssl && \
    mkdir -p /run/nginx

# Create self-signed SSL certificate
# RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/certs/server.key -out /etc/nginx/certs/server.crt -subj "/C=US/ST=CA/L=San Francisco/O=My Company/CN=example.com"

RUN mkdir -p /etc/nginx/certs

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Copy nginx configuration file
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
