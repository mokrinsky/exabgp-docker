FROM alpine:3.18
MAINTAINER Nikolay Mokrinsky <https://github.com/mokrinsky>

RUN apk --no-cache add exabgp

ADD entrypoint.sh /
ADD exabgp.conf.example /usr/etc/exabgp/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["exabgp"]
VOLUME ["/usr/etc/exabgp"]
EXPOSE 179
