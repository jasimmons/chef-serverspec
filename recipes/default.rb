#
# Cookbook Name:: serverspec
# Recipe:: default
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
