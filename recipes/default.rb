#
# Cookbook Name:: serverspec
# Recipe:: default
#
# Copyright (C) 2014 Jason Simmons
#
# All rights reserved - Do Not Redistribute
#

gem_package 'serverspec' do
  source node[:serverspec][:gem_source]
  version node[:serverspec][:gem_version]
  action :install
end

directory "#{node[:serverspec][:directory]}/spec/localhost" do
  recursive true
  mode 0644
  action :create
end

cookbook_file "#{node[:serverspec][:directory]}/Rakefile" do
  source 'Rakefile'
  mode 0755
  action :create
end

cookbook_file "#{node[:serverspec][:directory]}/spec/spec_helper.rb" do
  if node.platform_family.eql? 'windows'
    source 'spec_helper_windows.rb'
  else
    source 'spec_helper_ubuntu.rb'
  end
  mode 0755
  action :create
end
