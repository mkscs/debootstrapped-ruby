FROM ubuntu-debootstrap:15.10

ENV RUBY_VERSION 2.3

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6 && \
        echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu wily main > /etc/apt/sources.list.d/brightbox-ruby-ng-trusty.list && \
        apt-get update -q && apt-get install -yq --no-install-recommends \
        ruby$RUBY_VERSION \
        ruby$RUBY_VERSION-dev && \
        rm -rf /var/lib/apt/lists/* && \
        cat /dev/null >|  /var/log/*log