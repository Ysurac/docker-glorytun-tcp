FROM alpine:3.8

RUN apk add --no-cache iproute2 autoconf automake build-base gcc libsodium-dev linux-headers

# Add the glorytun launch script
ADD glorytun.sh /usr/sbin/glorytun.sh

# Glorytun TCP version 0.0.35
ENV version 0.0.35
WORKDIR /tmp
ADD https://github.com/angt/glorytun/releases/download/v${version}/glorytun-${version}.tar.gz /tmp/glorytun-${version}.tar.gz
RUN tar xzf /tmp/glorytun-${version}.tar.gz \
    && cd /tmp/glorytun-${version} \
    && ./autogen.sh && ./configure \
    && make && make install \
    && rm -rf /tmp/glorytun-${version} \
    && apk del autoconf automake build-base gcc linux-headers
CMD /usr/sbin/glorytun.sh
