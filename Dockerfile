FROM node:20.19.5-alpine3.22

ENTRYPOINT ["/bin/ash"]

WORKDIR "/root"

RUN cat /etc/profile > /root/.profile

RUN apk add --no-cache \
		bash coreutils curl nodejs unzip yarn \
	&& apk add --no-cache \
		icu-libs \
		php83 \
		php83-ctype php83-curl \
		php83-dom \
		php83-fileinfo \
		php83-gd \
		php83-iconv php83-intl \
		php83-json \
		php83-mbstring \
		php83-openssl \
		php83-pdo php83-phar \
		php83-simplexml php83-sockets \
		php83-tokenizer \
		php83-xml php83-xmlwriter \
	&& curl -sS https://getcomposer.org/installer \
		| php -- --install-dir=/usr/local/bin --filename=composer --version=2.9.1

COPY get-and-build-vanilla.sh /usr/local/bin/get-and-build-vanilla
RUN chmod +x /usr/local/bin/get-and-build-vanilla

ENTRYPOINT ["get-and-build-vanilla"]
