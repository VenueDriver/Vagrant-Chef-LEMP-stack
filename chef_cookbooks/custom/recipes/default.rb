include_recipe "chef_gem"
include_recipe "apt"
include_recipe "build-essential"
include_recipe "mysql::server"
include_recipe "php-fpm"
include_recipe "nginx-php-fpm"

%w( openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev
  libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool
  bison subversion pkg-config libmysqlclient-dev ruby-dev imagemagick
  libcurl3 libcurl3-gnutls libcurl4-openssl-dev rubygems ruby-bundler ).each do |pkg|
  package pkg do
    action :install
    ignore_failure true
  end
end

bash "Create database 'webapp'" do
  user 'root'
  code "mysql -uroot -pilikerandompasswords -e 'create database if not exists webapp'"
end