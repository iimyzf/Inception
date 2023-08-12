FROM alpine:3.14

RUN apk update && apk add nginx

COPY ./conf/my.conf /etc/nginx/http.d/default.conf

COPY ./website /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]