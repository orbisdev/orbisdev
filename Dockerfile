ARG BASE_DOCKER_IMAGE

FROM $BASE_DOCKER_IMAGE

COPY . /src

RUN apk add build-base clang bash git wget cmake linux-headers
RUN cd /src && ./build-extra.sh

# Second stage of Dockerfile
FROM alpine:latest  

ENV ORBISDEV /usr/local/orbisdev
ENV PATH $ORBISDEV/bin:$PATH

COPY --from=0 ${ORBISDEV} ${ORBISDEV}