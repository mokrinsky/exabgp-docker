FROM alpine:3.18

ARG VERSION
ARG PROXY

RUN apk --no-cache add wget curl python3 python3-dev py-setuptools coreutils netcat-openbsd bash \
    && apk --no-cache add --virtual build-dependencies build-base py-pip  \
    && mkdir -p /etc/exabgp \
    && export https_proxy=http://$PROXY http_proxy=http://$PROXY HTTPS_PROXY=http://$PROXY HTTP_PROXY=http://$PROXY \
    && pip install ipaddr exabgp==$VERSION ipy requests \
    && apk del build-dependencies 

RUN mkfifo /run/exabgp.in && mkfifo /run/exabgp.out && chmod 600 /run/exabgp.*

CMD ["exabgp"]
VOLUME ["/etc/exabgp"]
EXPOSE 179
