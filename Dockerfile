FROM ruby:2.7.8 AS base

WORKDIR /srv/slate
EXPOSE 4567

COPY Gemfile .
COPY Gemfile.lock .

# Bullseye is archived; use frozen indexes without expiry checks.
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        nodejs \
    && gem install bundler -v 2.4.22 \
    && bundle install \
    && apt-get remove -y build-essential git \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /srv/slate

RUN chmod +x /srv/slate/slate.sh

ENTRYPOINT ["/srv/slate/slate.sh"]

FROM base AS prod
CMD ["build"]

FROM base AS dev
CMD ["serve"]
