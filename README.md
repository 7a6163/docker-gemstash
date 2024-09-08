![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/7a6163/docker-gemstash/release.yml)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/7a6163/gemstash)

# Docker image of Gemstash

## Overview
[gemstash](https://github.com/rubygems/gemstash) A RubyGems.org cache and private gem server.
This docker image include gemstash on runtime of the official [ruby:3-alpine](https://hub.docker.com/_/ruby).

## Usage

### Quick start
Do mapping local port to listening 9292 port on the container, which activate gemstash.
In order to open local port 8080 up to container, docker run command as follows.
```bash
docker run -d -p 8080:9292 7a6163/gemstash:latest
```
After executing the command, you can browse gemstash where http://localhost:8080.
<br>
Then, executing the follwing command enables gem networking your own gemstash.
```bash
gem sources -a http://localhost:8080/
```
Finally, you can upload or delete gems through browsing gemstash, and install gems by cli like as follows.
```bash
gem install GEM
```
