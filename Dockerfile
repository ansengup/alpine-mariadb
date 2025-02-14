FROM alpine
LABEL maintainer="leafney <babycoolzx@126.com>"

ENV MYSQL_VERSION=10.3.18-r0

#RUN apk add --no-cache mysql=${MYSQL_VERSION} mysql-client=${MYSQL_VERSION} mariadb-server-utils=${MYSQL_VERSION} && \
RUN apk add --no-cache mysql mysql-client mariadb-server-utils && \
	addgroup mysql mysql && \
	mkdir /scripts && \
	rm -rf /var/cache/apk/*

COPY ./startup.sh /scripts/startup.sh
RUN chmod +x /scripts/startup.sh

VOLUME ["/var/lib/mysql"]
EXPOSE 3306

ENTRYPOINT ["/scripts/startup.sh"]
