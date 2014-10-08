#
# Cookbook Name:: serverspec
# Recipe:: run_tests
#
# Copyright (C) 2014 Jason Simmons
#
# All rights reserved - Do Not Redistribute
#

execute 'run-serverspec-tests' do
  cwd node[:serverspec][:directory]
  command "rake spec >> #{node[:serverspec][:logfile]}"
  action :nothing
end

execute 'delayed-tests' do
  command "echo 'Running Serverspec tests...' >> #{node[:serverspec][:logfile]}"
  action :run
  notifies :run, 'execute[run-serverspec-tests]', :delayed
end
