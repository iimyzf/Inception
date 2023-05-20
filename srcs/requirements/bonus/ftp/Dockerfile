FROM alpine:3.14

RUN apk update && \
	apk add vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN adduser -D -h /var/ftp yagnaou && \
    echo "yagnaou:password" | chpasswd && \
    mkdir -p /var/ftp && \
    chown -R yagnaou:yagnaou /var/ftp && \
    chmod 755 /var/ftp

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
