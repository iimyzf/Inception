FROM alpine:3.14

RUN apk update && \
	apk add redis 

CMD ["redis-server", "--protected-mode","no"]