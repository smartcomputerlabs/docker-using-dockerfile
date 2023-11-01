# syntax=docker/dockerfile:1

FROM bellcstech/ubuntu-nginx-nodejs
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y gnupg
RUN apt-get update && apt-get install -y gnupg1
RUN apt-get update && apt-get install -y gnupg2
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn
RUN yarn install --production
RUN apt-get update && apt-get install -y software-properties-common npm
EXPOSE 3000
