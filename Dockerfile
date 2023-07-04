FROM alpine:3.18
MAINTAINER Nikolay Mokrinsky <https://github.com/mokrinsky>

RUN echo "@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk --no-cache add exabgp@testing

ADD entrypoint.sh /
ADD exabgp.conf.example /usr/etc/exabgp/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["exabgp"]
VOLUME ["/usr/etc/exabgp"]
EXPOSE 179
