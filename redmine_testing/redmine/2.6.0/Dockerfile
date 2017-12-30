# http://blog.redmine.jp/articles/2_6/installation_centos/

FROM centos:7

ENV REDMINE_LANG ja
ENV GOSU_VERSION 1.10

RUN \
# Add user and install required packages
  groupadd -r redmine && useradd -r -g redmine redmine && \
  yum update -y && \
  yum install -y --nogpgcheck sysvinit-tools wget gcc make git mariadb-devel ImageMagick ImageMagick-devel libxml2-devel libxslt-devel ipa-pgothic-fonts && \

# Setup gosu for easier command execution
  gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
  curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" && \
  curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64.asc" && \
  gpg --verify /usr/local/bin/gosu.asc && \
  rm /usr/local/bin/gosu.asc && \
  rm -r /root/.gnupg/ && \
  chmod +x /usr/local/bin/gosu && \

# Install ruby 2.4.1
#  wget -O ruby-2.4.1.tar.gz http://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz && \
#  tar xvf ruby-2.4.1.tar.gz && \
#  cd ruby-2.4.1 && \
#  ./configure --disable-install-doc && \
#  make && \
#  make install && \
#  cd .. && \
#  rm -f ruby-2.4.1.tar.gz && \
#  rm -rf ruby-2.4.1 && \
#  gem install -v 1.15.1 bundler --no-rdoc --no-ri && \

  # Install ruby 2.3.3
    wget -O ruby-2.3.3.tar.gz http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.gz && \
    tar xvf ruby-2.3.3.tar.gz && \
    cd ruby-2.3.3 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -f ruby-2.3.3.tar.gz && \
    rm -rf ruby-2.3.3 && \
#    gem install -v 1.15.1 bundler --no-rdoc --no-ri && \
    gem install -v 1.16.1 bundler --no-rdoc --no-ri && \



# Install redmine 2.6.0
  cd /opt && \
  wget --no-check-certificate -O 2.6.0.tar.gz https://github.com/redmine/redmine/archive/2.6.0.tar.gz && \
  tar xvf 2.6.0.tar.gz && \
  rm -f /opt/2.6.0.tar.gz && \
  chown -R redmine:redmine /opt/redmine-2.6.0 && \
  ln -s /opt/redmine-2.6.0 /opt/redmine && \
  mkdir -p /opt/redmine/tmp /opt/redmine/public/plugin_assets && \
  chown -R 755 /opt/redmine/files /opt/redmine/log /opt/redmine/tmp /opt/redmine/public/plugin_assets
COPY database.yml /opt/redmine/config/
RUN \
  cd /opt/redmine && \
  bundle config build.nokogiri --use-system-libraries && \
  gosu redmine bundle install --without development test rmagick --path vendor/bundle
#  gem install -v 4.1.6 rails --no-rdoc --no-ri

# Prepare scripts
COPY setup.sh /opt/redmine/
COPY set_default.sh /opt/redmine/
COPY start.sh /opt/redmine/
COPY stop.sh /opt/redmine/
RUN \
  ln -s /opt/redmine/setup.sh /setup.sh && \
  ln -s /opt/redmine/setup.sh /set_default.sh && \
  ln -s /opt/redmine/start.sh /start.sh && \
  ln -s /opt/redmine/stop.sh /stop.sh && \
  chmod +x /setup.sh /setup.sh && \
  chmod +x /set_default.sh /set_default.sh && \
  chmod +x /setup.sh /start.sh && \
  chmod +x /setup.sh /stop.sh && \

# Clean up
  yum clean all && \
  rm -rf /var/cache/yum

WORKDIR /opt/redmine
EXPOSE 3000
CMD tail -f /dev/null
