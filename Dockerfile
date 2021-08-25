ARG BASE_DOCKER_IMAGE

FROM $BASE_DOCKER_IMAGE

COPY . /src

RUN apk add build-base clang bash git wget cmake linux-headers bison flex m4

# Install dontnet
RUN apk add libintl icu-dev
RUN wget https://dot.net/v1/dotnet-install.sh && chmod 755 dotnet-install.sh && ./dotnet-install.sh -c Current --install-dir ~/cli
ENV PATH ~/cli:$PATH

RUN cd /src && ./build-extra.sh

# Second stage of Dockerfile
FROM alpine:latest  

ENV ORBISDEV /usr/local/orbisdev
ENV PATH $ORBISDEV/bin:$PATH

COPY --from=0 ${ORBISDEV} ${ORBISDEV}