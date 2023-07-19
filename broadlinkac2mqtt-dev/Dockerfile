ARG BUILD_FROM

FROM ${BUILD_FROM} AS runtime

ARG BUILD_ARCH
ARG BUILD_VERSION

WORKDIR /broadlinkac2mqtt

# Install dependencies and build the binary to target platform
RUN \
    if [ "${BUILD_ARCH}" = "armhf" ]; then \
    wget -O broadlinkac2mqtt.tar.gz https://github.com/ArtemVladimirov/broadlinkac2mqtt/releases/download/v1.3.2-beta/broadlinkac2mqtt-v1.3.2-beta-linux-arm.tar.gz; \
    elif [ "${BUILD_ARCH}" = "armv7" ]; then \
    wget -O broadlinkac2mqtt.tar.gz https://github.com/ArtemVladimirov/broadlinkac2mqtt/releases/download/v1.3.2-beta/broadlinkac2mqtt-v1.3.2-beta-linux-arm7.tar.gz; \
    elif [ "${BUILD_ARCH}" = "aarch64" ]; then \
    wget -O broadlinkac2mqtt.tar.gz https://github.com/ArtemVladimirov/broadlinkac2mqtt/releases/download/v1.3.2-beta/broadlinkac2mqtt-v1.3.2-beta-linux-arm64.tar.gz; \
    elif [ "${BUILD_ARCH}" = "i386" ]; then \
    wget -O broadlinkac2mqtt.tar.gz https://github.com/ArtemVladimirov/broadlinkac2mqtt/releases/download/v1.3.2-beta/broadlinkac2mqtt-v1.3.2-beta-linux-386.tar.gz; \
    elif [ "${BUILD_ARCH}" = "amd64" ]; then \
    wget -O broadlinkac2mqtt.tar.gz https://github.com/ArtemVladimirov/broadlinkac2mqtt/releases/download/v1.3.2-beta/broadlinkac2mqtt-v1.3.2-beta-linux-amd64.tar.gz; \
    else \
    echo 'NOT VALID BUILD'; exit 1; \
    fi \
    && tar -xzf broadlinkac2mqtt.tar.gz \
    && rm broadlinkac2mqtt.tar.gz

COPY run.sh .
RUN chmod a+x ./run.sh \
    && mkdir config \
    && apk add --no-cache gcc g++ make \
    && pip3 install --no-cache-dir -U \
    pyyaml

CMD "/broadlinkac2mqtt/run.sh" && "/broadlinkac2mqtt/broadlinkac2mqtt"

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF

# Labels
LABEL \
    io.hass.name="broadlinkac2mqtt" \
    io.hass.description="Control your broadlink-based air conditioner using Home Assistant" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Artem Vladimirov <artyom-vladimirov@yandex.ru>" \
    org.label-schema.description="Control your broadlink-based air conditioner using Home Assistant" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="broadlinkac2mqtt" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://addons.community" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-example/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-example" \
    org.label-schema.vendor="Community Hass.io Addons"
