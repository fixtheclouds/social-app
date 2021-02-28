FROM ruby:3.0.0-alpine

RUN apk add --no-cache build-base postgresql postgresql-dev libpq
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/v3.13/main/ \
    nodejs=14.16.0-r0 npm

ENV WEB_ROOT /web
RUN mkdir $WEB_ROOT
WORKDIR $WEB_ROOT

ENV LANG=en_US.UTF-8

# Install ruby things
COPY Gemfile ${WEB_ROOT}
COPY Gemfile.lock ${WEB_ROOT}
RUN bundle install -j $(nproc) --quiet

# Install node things
COPY package*.json ${WEB_ROOT}/
RUN npm i

COPY . ${WEB_ROOT}

EXPOSE 3000

CMD ["/docker-entrypoint-empty.sh"]
