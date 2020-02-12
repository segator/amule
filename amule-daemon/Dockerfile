FROM alpine:latest

ENV AMULE_VERSION 2.3.2
ENV UPNP_VERSION 1.6.22
ENV CRYPTOPP_VERSION CRYPTOPP_5_6_5
ENV AMULE_PORT 4662
ENV AMULE_DAEMON_PORT 4712
ENV AMULE_WEB_PORT 4711
ENV AMULE_MAX_SOURCES_FILE 500
ENV AMULE_MAX_CONNECTIONS 1500
ENV AMULE_TEMP /amule/tmp
ENV AMULE_INCOMING /amule/download
ENV AMULE_DOWNLOAD_CAPACITY 200000
ENV AMULE_UPLOAD_CAPACITY 10000

RUN apk --update add gd geoip libpng libwebp pwgen sudo wxgtk zlib bash && \
    apk --update add --virtual build-dependencies alpine-sdk automake \
                               autoconf bison g++ gcc gd-dev geoip-dev \
                               gettext gettext-dev git libpng-dev libwebp-dev \
                               libtool libsm-dev make musl-dev wget \
                               wxgtk-dev zlib-dev \
    && mkdir -p /opt \
    && cd /opt \
    && wget "http://downloads.sourceforge.net/sourceforge/pupnp/libupnp-${UPNP_VERSION}.tar.bz2" \
    && tar xvfj libupnp*.tar.bz2 \
    && cd libupnp* \
    && ./configure --prefix=/usr \
    && make -j$(nproc) \
    && make install \
    && mkdir -p /opt && cd /opt \
    && git clone --branch ${CRYPTOPP_VERSION} --single-branch "https://github.com/weidai11/cryptopp" /opt/cryptopp \
    && cd /opt/cryptopp \
    && sed -i -e 's/^CXXFLAGS/#CXXFLAGS/' GNUmakefile \
    && export CXXFLAGS="${CXXFLAGS} -DNDEBUG -fPIC" \
    && make -f GNUmakefile -j$(nproc) \
    && make libcryptopp.so -j$(nproc)\
    && install -Dm644 libcryptopp.so* /usr/lib/ \
    && mkdir -p /usr/include/cryptopp \
    && install -m644 *.h /usr/include/cryptopp/ \
    && mkdir -p /opt/amule \
    && git clone --branch ${AMULE_VERSION} --single-branch "https://github.com/amule-project/amule" /opt/amule \
    && cd /opt/amule \
    && ./autogen.sh \
    && ./configure \
        --disable-gui \
        --disable-amule-gui \
        --disable-wxcas \
        --disable-alc \
        --disable-plasmamule \
        --disable-kde-in-home \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --enable-unicode \
        --without-subdirs \
        --without-expat \
        --enable-amule-daemon \
        --enable-amulecmd \
        --enable-webserver \
        --enable-cas \
        --enable-alcc \
        --enable-fileview \
        --enable-geoip \
        --enable-mmap \
        --enable-optimize \
        --enable-upnp \
        --disable-debug \
    && make -j$(nproc) \
    && make install \
    && rm -rf /var/cache/apk/* && rm -rf /opt \
    && apk del build-dependencies
COPY amule.sh /app/amule.sh


EXPOSE 4711/tcp 4712/tcp 4672/udp 4665/udp 4662/tcp 4662/udp

ENTRYPOINT ["/app/amule.sh"]
