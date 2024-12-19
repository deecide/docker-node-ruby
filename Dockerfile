ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-slim
ARG NODE_VERSION
ARG BUILDER=false

# Base packages
RUN apt-get update -qq && apt-get install -qq --no-install-recommends curl gnupg2

# Node
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
  && apt-get install -qq --no-install-recommends nodejs \
  && npm install -g yarn

# Builder packages
RUN if [ "$BUILDER" = "true" ]; then \
    apt-get install -qq --no-install-recommends git autoconf build-essential postgresql-common imagemagick \
    && /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y \
    && apt-get install -qq --no-install-recommends postgresql-client-17 libpq-dev; \
  fi

# Clean up
RUN if [ "$BUILDER" = "false" ]; then \
    apt-get clean \
    && rm -rf /var/lib/apt/lists/*; \
  fi
