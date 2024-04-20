FROM node:14.21.3-alpine3.17

ENTRYPOINT ["/bin/ash"]

WORKDIR "/root"

RUN cat /etc/profile > /root/.profile

RUN apk add --no-cache \
		bash coreutils curl nodejs unzip yarn \
	&& apk add --no-cache \
		icu-libs \
		php81 \
		php81-ctype php81-curl \
		php81-dom \
		php81-fileinfo \
		php81-gd \
		php81-iconv php81-intl \
		php81-json \
		php81-mbstring \
		php81-openssl \
		php81-pdo php81-phar \
		php81-simplexml php81-sockets \
		php81-tokenizer \
		php81-xml php81-xmlwriter \
	&& curl -sS https://getcomposer.org/installer \
		| php -- --install-dir=/usr/local/bin --filename=composer --version=2.6.5

COPY get-and-build-vanilla.sh /usr/local/bin/get-and-build-vanilla
RUN chmod +x /usr/local/bin/get-and-build-vanilla

ENTRYPOINT ["get-and-build-vanilla"]
