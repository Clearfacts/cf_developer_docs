FROM ruby:2.3.7-onbuild
MAINTAINER Adrian Perez <adrian@adrianperez.org>

VOLUME /usr/src/app/source
EXPOSE 4567

# Switch buster repos to the archive mirrors
RUN echo "deb http://archive.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9 648ACFD622F3D138

# Update+install (archives are frozen → disable Valid-Until) and clean up
RUN DEBIAN_FRONTEND=noninteractive apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
