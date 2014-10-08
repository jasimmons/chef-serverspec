if node.platform_family.eql? 'windows'
  default[:serverspec][:directory] = 'C:\serverspec'
else
  default[:serverspec][:directory] = '/tmp/serverspec'
end

default[:serverspec][:log_location] = 'serverspec.log'
default[:serverspec][:gem_source] = 'https://rubygems.org'
default[:serverspec][:gem_version] = '1.16.0'
