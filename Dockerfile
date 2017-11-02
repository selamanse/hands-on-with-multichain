FROM ubuntu:16.04

RUN apt-get update && apt-get install -y zip unzip php7.0 php7.0-zip php7.0-mysql curl git

# copy source
RUN mkdir /home/handson
COPY . /home/handson/
WORKDIR /home/handson

RUN useradd handson && chown -R handson: /home/handson
USER handson

RUN cd /home/handson && \
    ls -lah && \
    curl -sS https://getcomposer.org/installer | php && \
    php ./composer.phar install

# RUN ./bin/doctrine orm:schema-tool:create
