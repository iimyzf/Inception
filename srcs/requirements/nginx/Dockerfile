FROM alpine:3.14

RUN apk update && \
	apk add nginx openssl && \
    mkdir -p /run/nginx

RUN mkdir -p /etc/nginx/certs && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/server.key -out /etc/nginx/certs/server.crt -subj "/CN=yagnaou.42.fr"

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
