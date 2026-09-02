ARG BUILD_FROM

FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
ARG RELEASE_TAG=v1.5.7

RUN \
    set -e \
    && if [ "${BUILD_ARCH}" = "armhf" ]; then \
        ARCH_SUFFIX="linux-arm"; \
    elif [ "${BUILD_ARCH}" = "armv7" ]; then \
        ARCH_SUFFIX="linux-armv7"; \
    elif [ "${BUILD_ARCH}" = "aarch64" ]; then \
        ARCH_SUFFIX="linux-arm64"; \
    elif [ "${BUILD_ARCH}" = "i386" ]; then \
        ARCH_SUFFIX="linux-386"; \
    elif [ "${BUILD_ARCH}" = "amd64" ]; then \
        ARCH_SUFFIX="linux-amd64"; \
    else \
        echo "NOT VALID BUILD"; exit 1; \
    fi \
    && curl -fsSL -o /tmp/broadlinkac2mqtt.tar.gz \
        "https://github.com/ArtemVladimirov/broadlinkac2mqtt/releases/download/${RELEASE_TAG}/broadlinkac2mqtt-${RELEASE_TAG}-${ARCH_SUFFIX}.tar.gz" \
    && tar -xzf /tmp/broadlinkac2mqtt.tar.gz -C /tmp \
    && mv /tmp/broadlinkac2mqtt /usr/bin/broadlinkac2mqtt \
    && chmod +x /usr/bin/broadlinkac2mqtt \
    && rm -f /tmp/broadlinkac2mqtt.tar.gz /tmp/README.md /tmp/LICENSE

ENTRYPOINT ["/usr/bin/broadlinkac2mqtt"]

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
