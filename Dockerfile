FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    s3cmd \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV HUGO_VERSION 0.14
RUN curl -sSL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux_amd64.tar.gz | tar -v -C /usr/local/bin -xz --strip-components 1 && \
    mv /usr/local/bin/hugo_${HUGO_VERSION}_linux_amd64 /usr/local/bin/hugo

# Setup s3cmd config
#RUN { \
    #echo '[default]'; \
    #echo 'access_key=$BLOG_AWS_ACCESS_KEY'; \
    #echo 'secret_key=$BLOG_AWS_SECRET_KEY'; \
    #} > ~/.s3cfg

#WORKDIR /usr/src/blog/

# add files
COPY . /usr/src/blog/

ENTRYPOINT [ "/usr/src/blog/release.sh" ]
