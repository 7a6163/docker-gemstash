FROM ruby:3-alpine AS builder

RUN apk add --no-cache build-base=0.5-r3 git=2.45.2-r0 postgresql16-dev=16.3-r0 sqlite-dev=3.45.3-r1
WORKDIR /app
COPY Gemfile* ./
RUN gem install bundler:2.5.11
RUN bundle install

FROM ruby:3-alpine

RUN apk add --no-cache tini=0.19.0-r3 postgresql16-client=16.3-r0
WORKDIR /app
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY Gemfile* ./
COPY config.yml /root/.gemstash/

ENV RACK_ENV production

EXPOSE 9292
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["bundle", "exec", "gemstash", "start", "--no-daemonize"]
