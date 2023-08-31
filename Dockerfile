FROM node:14.21.1-alpine3.15

ENTRYPOINT ["/bin/ash"]

WORKDIR "/root"

RUN cat /etc/profile > /root/.profile

RUN apk add --no-cache \
		bash coreutils curl nodejs unzip yarn \
	&& apk add --no-cache \
		icu-libs \
		php7 \
		php7-ctype php7-curl \
		php7-dom \
		php7-fileinfo \
		php7-gd \
		php7-iconv php7-intl \
		php7-json \
		php7-mbstring \
		php7-openssl \
		php7-pdo php7-phar \
		php7-simplexml \
		php7-tokenizer \
		php7-xml php7-xmlwriter \
	&& curl -sS https://getcomposer.org/installer \
		| php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.26

COPY get-and-build-vanilla.sh /usr/local/bin/get-and-build-vanilla
RUN chmod +x /usr/local/bin/get-and-build-vanilla

ENTRYPOINT ["get-and-build-vanilla"]
