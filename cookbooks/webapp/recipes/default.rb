#
# Cookbook:: webapp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'webapp::setup'
include_recipe 'ruby_build'
include_recipe "ruby_rbenv::system"

include_recipe "chef_nginx::default"
nginx_site "webapp" do
  template 'nginx.conf.erb'
  variables app_path: "/srv/webapp"
end

include_recipe 'webapp::deploy'
