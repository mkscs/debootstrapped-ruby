FROM ubuntu-debootstrap:15.10

ENV RUBY_VERSION 2.3

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6 \
    && echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu wily main > /etc/apt/sources.list.d/brightbox-ruby-ng-trusty.list \
    && apt-get update -q && apt-get install -yq  autoconf bison build-essential libreadline6-dev zlib1g-dev libncurses5-dev libssl-dev libyaml-dev \
       --no-install-recommends \
       ruby$RUBY_VERSION \
       ruby$RUBY_VERSION-dev \
    && gem install bundler --no-rdoc --no-ri && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && cat /dev/null >|  /var/log/*log
