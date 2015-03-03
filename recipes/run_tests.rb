#
# Cookbook Name:: serverspec
# Recipe:: run_tests
#
# Copyright (C) 2014 Jason Simmons
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
