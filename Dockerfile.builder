ARG NODE_VERSION
ARG RUBY_VERSION

FROM insurgate/node_ruby:${NODE_VERSION}-${RUBY_VERSION}

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/main" >> /etc/apk/repositories && \
    echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories
RUN apk update
RUN apk add \
    python3 \
    make \
    g++ \
    autoconf \
    automake \
    curl \
    git \
    postgresql17-dev \
    build-base \
    libtool \
    pkgconfig \
    nasm \
    autoconf-archive \
    file \
    m4 \
    libpng-dev \
    zlib-dev \
    gifsicle \
    pngquant \
    cmake
