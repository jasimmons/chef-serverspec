actions :create

attribute :source, kind_of: String, required: true

def initialize(*args)
  super
  @action = :create
end

def after_created
  unless name =~ /([\w\.]+[-_])*_spec.rb/
    raise Chef::Exceptions::ValidationFailed, 'All Serverspec test files must end in _spec.rb'
  end
end
