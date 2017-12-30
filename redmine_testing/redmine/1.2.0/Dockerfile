# http://blog.redmine.jp/articles/redmine-1_2-installation_centos/

FROM centos:6

ENV REDMINE_LANG ja

RUN \
  yum update -y && \
  yum install -y --nogpgcheck sysvinit-tools ruby ruby-devel rubygems wget gcc make mysql-devel && \
  gem install -v 1.3.7 rubygems-update --no-rdoc --no-ri && \
  gem install -v 0.8.7 rake --no-rdoc --no-ri && \
  gem install -v 1.1.1 rack --no-rdoc --no-ri && \
  gem install -v 0.4.2 i18n --no-rdoc --no-ri && \
  gem install -v 2.3.11 rails --no-rdoc --no-ri && \
  # it's so strange!
  gem install -v 2.8.1 mysql --no-rdoc --no-ri && \
  cd /opt && \
  wget --no-check-certificate -O 1.2.0.tar.gz https://github.com/redmine/redmine/archive/1.2.0.tar.gz && \
  tar xvf 1.2.0.tar.gz && \
  ln -s /opt/redmine-1.2.0 /opt/redmine && \
  rm -f /opt/1.2.0.tar.gz && \
  mkdir -p /opt/redmine/tmp /opt/redmine/public/plugin_assets && \
  chown -R 755 /opt/redmine/files /opt/redmine/log /opt/redmine/tmp /opt/redmine/public/plugin_assets && \
  yum clean all && \
  gem install -v 2.8.1 mysql --no-rdoc --no-ri -- --with-mysql-config=/usr/bin/mysql_config
COPY database.yml /opt/redmine/config/

# Prepare scripts
COPY setup.sh /opt/redmine/
COPY set_default.sh /opt/redmine/
COPY start.sh /opt/redmine/
COPY stop.sh /opt/redmine/
RUN \
  chmod +x /opt/redmine/*.sh && \
  ln -s /opt/redmine/setup.sh /setup.sh && \
  ln -s /opt/redmine/setup.sh /set_default.sh && \
  ln -s /opt/redmine/start.sh /start.sh && \
  ln -s /opt/redmine/stop.sh /stop.sh

WORKDIR /opt/redmine
EXPOSE 3000
CMD tail -f /dev/null
