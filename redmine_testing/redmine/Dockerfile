FROM centos:6

ENV REDMINE_LANG en

RUN \
  yum update -y && \
  yum install -y --nogpgcheck ruby ruby-devel rubygems wget gcc mysql-devel && \
  gem install -y -v 2.4.2 rdoc && \
  gem install -y -v 1.3.7 rubygems-update && \
  gem install -y -v 0.8.2 rake && \
  gem install -y -v 1.0.1 rack && \
  gem install -y -v 2.1.2 rails && \
  # it's so strange!
  gem install -y -v 2.8.1 mysql && \
  cd /opt && \
  wget -O 0.8.4.tar.gz https://github.com/redmine/redmine/archive/0.8.4.tar.gz && \
  tar xvf 0.8.4.tar.gz && \
  ln -s /opt/redmine-0.8.4 /opt/redmine && \
  rm -f /opt/0.8.4.tar.gz && \
  mkdir -p /opt/redmine/tmp /opt/redmine/public/plugin_assets && \
  chown -R 755 /opt/redmine/files /opt/redmine/log /opt/redmine/tmp /opt/redmine/public/plugin_assets && \
  yum clean all && \
  gem install -y -v 2.8.1 mysql -- --with-mysql-config=/usr/bin/mysql_config

COPY database.yml /opt/redmine/config/

RUN \
  cd /opt/redmine
#  rake db:migrate RAILS_ENV="production" && \
#  nohup ruby /opt/redmine/script/server webrick -e production > /dev/null

WORKDIR /opt/redmine

CMD tail -f /dev/null
