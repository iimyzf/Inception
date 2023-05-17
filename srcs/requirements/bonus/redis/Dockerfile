FROM alpine:3.14

RUN apk update && \
	apk add redis 
	# sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis.conf && \
	# sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis.conf

# COPY redis.conf /etc/redis.conf

# EXPOSE 6379

# COPY ./tools/setup.sh /tmp/setup.sh

# RUN chmod +x /tmp/setup.sh

# WORKDIR /tmp

# CMD ./setup.sh
CMD ["redis-server", "--protected-mode","no"]