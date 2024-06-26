ARG BUILD_FROM

FROM golang:1.22.2-alpine as build

# Build arguments
ARG BUILD_ARCH

WORKDIR /app

# Загружаем архив и распаковываем его
RUN wget https://github.com/ArtemVladimirov/broadlinkac2mqtt/archive/refs/tags/v1.5.5.zip && \
    unzip v1.5.5.zip && \
    mv /app/broadlinkac2mqtt-1.5.5 /app/broadlinkac2mqtt && \
    rm v1.5.5.zip

# Переходим в распакованную директорию
WORKDIR /app/broadlinkac2mqtt

# Install dependencies and build the binary to target platform
RUN \
    go get -d -v ./... \
    && go install -v ./... \
    && cd /app/broadlinkac2mqtt \
    && \
    if [ "${BUILD_ARCH}" = "armhf" ]; then \
    GOOS=linux GOARCH=arm go build; \
    elif [ "${BUILD_ARCH}" = "armv7" ]; then \
    GOOS=linux GOARM=7 GOARCH=arm go build; \
    elif [ "${BUILD_ARCH}" = "aarch64" ]; then \
    GOOS=linux GOARCH=arm64 go build; \
    elif [ "${BUILD_ARCH}" = "i386" ]; then \
    GOOS=linux GOARCH=386 go build; \
    elif [ "${BUILD_ARCH}" = "amd64" ]; then \
    GOOS=linux GOARCH=amd64 go build; \
    else \
    echo 'NOT VALID BUILD'; exit 1; \
    fi

# STAGE 2: Include binary in target add-on container
FROM ${BUILD_FROM} AS runtime

WORKDIR /broadlinkac2mqtt

# Copy binary from build container
COPY --from=build /app/broadlinkac2mqtt/broadlinkac2mqtt .

COPY run.sh .
RUN chmod a+x ./run.sh

RUN mkdir config

RUN apk add --no-cache gcc g++ make \
    && pip3 install --no-cache-dir -U \
    pyyaml

CMD "/broadlinkac2mqtt/run.sh" && "/broadlinkac2mqtt/broadlinkac2mqtt"

#
# LABEL target docker image
#

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

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
