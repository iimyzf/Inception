FROM alpine:3.14

# Install Nginx and other dependencies
RUN apk update && apk add nginx

# Copy the custom Nginx configuration file
COPY ./conf/my.conf /etc/nginx/http.d/default.conf

# Copy the static website files to the appropriate directory in the container
COPY ./website /usr/share/nginx/html

# Expose port 80 for Nginx
# EXPOSE 5050

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]