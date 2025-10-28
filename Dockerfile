FROM ruby:2.7.8 AS base

WORKDIR /srv/slate
EXPOSE 4567

COPY Gemfile .
COPY Gemfile.lock .

# Update+install (archives are frozen → disable Valid-Until) and clean up
RUN apt-get update \
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
