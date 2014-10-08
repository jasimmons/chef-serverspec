require 'spec_helper'

if /cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM
  dir = 'C:\serverspec'
else
  dir = '/tmp/serverspec'
end

describe file "#{dir}/Rakefile" do
  it { should be_file }
end

describe file "#{dir}/spec/localhost" do
  it { should be_directory }
end

describe file "#{dir}/spec/spec_helper.rb" do
  it { should be_file }
end

describe command 'gem list' do
  its (:stdout) { should match /serverspec/ }
end
