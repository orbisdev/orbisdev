ARG BASE_DOCKER_IMAGE

FROM $BASE_DOCKER_IMAGE

COPY . /src

RUN apk add build-base clang bash git wget cmake linux-headers
RUN cd /src && ./build-extra.sh

# Second stage of Dockerfile
FROM alpine:latest  

ENV ORBISDEV /usr/local/orbisdev
ENV PS4TOOLCHAIN $ORBISDEV/toolchain
ENV PATH $ORBISDEV/bin:$PS4TOOLCHAIN/x86_64-pc-freebsd9/bin:$PS4TOOLCHAIN/bin:$PATH
ENV PS4SDK $ORBISDEV

COPY --from=0 ${ORBISDEV} ${ORBISDEV}