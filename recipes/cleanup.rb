#
# Cookbook Name:: serverspec
# Recipe:: cleanup
#
# Copyright (C) 2014 Jason Simmons
#
# All rights reserved - Do Not Redistribute
#

directory node[:serverspec][:directory] do
  recursive true
  action :delete
end

gem_package 'serverspec' do
  action :purge
end
