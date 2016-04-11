FROM alpine:latest
MAINTAINER AJ Bowen <aj@soulshake.net>

ENV HUGO_VERSION=0.15
RUN apk add --update wget ca-certificates && \
  wget --no-check-certificate https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux_amd64.tar.gz && \
  tar xzf hugo_${HUGO_VERSION}_linux_amd64.tar.gz && \
  rm -r hugo_${HUGO_VERSION}_linux_amd64.tar.gz && \
  mv hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo && \
  rm -r hugo_${HUGO_VERSION}_linux_amd64 && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

COPY ./run.sh /run.sh

COPY ./src /src

ENV HUGO_BASEURL=blog.soulshake.net
ENV HUGO_REFRESH_TIME=3600

EXPOSE 1313
CMD ["/run.sh"]
