FROM alpine:3.14

RUN apk update && \
	apk add vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

# COPY ./tools/setup.sh /tmp/setup.sh

# RUN chmod +x /tmp/setup.sh

# RUN adduser -D -h /var/ftp yagnaou && \
#     echo "yagnaou:password" | chpasswd && \
#     mkdir -p /var/ftp && \
#     chown -R yagnaou:yagnaou /var/ftp && \
#     chmod 755 /var/ftp

RUN adduser yagnaou --disabled-password --home /home/yagnaou --shell /bin/sh && \
	echo "yagnaou:password" | chpasswd

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]

# CMD [ "/bin/sh", "-c", "/tmp/setup.sh" ]