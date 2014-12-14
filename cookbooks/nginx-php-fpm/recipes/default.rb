#
# Cookbook Name:: nginx-php-fpm
# Recipe:: default
# Author:: Shen DeShayne <shennyg@gmail.com>
#

# install nginx
include_recipe 'nginx'

# create webroot
directory node['nginx']['webroot'] do
  recursive true
  owner 'vagrant'
  group "www-data"
  mode 00755
  action :create
end

package "php5-mysql" do
  action :install
end

package "php-apc" do
  action :install
end

package "php5-curl" do
  action :install
  notifies :reload, 'service[php-fpm]'
end

# create nginx server block file
template "#{node['nginx']['dir']}/sites-available/default" do
  source "webapp.erb"
  owner "root"
  group "root"
  mode 00755
end
