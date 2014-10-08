action :create do
  f = cookbook_file "#{node[:serverspec][:directory]}/spec/localhost/#{new_resource.name}" do
    source new_resource.source
    action :create
  end

  new_resource.updated_by_last_action(f.updated_by_last_action?)
end
