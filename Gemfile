source "https://rubygems.org"

gemspec

branch = File.read(File.expand_path("../maintenance-branch", __FILE__)).chomp
%w[rspec rspec-core rspec-mocks rspec-support].each do |lib|
  library_path = File.expand_path("../../#{lib}", __FILE__)
  if File.exist?(library_path) && !ENV['USE_GIT_REPOS']
    gem lib, :path => library_path
  else
    gem lib, :git => "git://github.com/rspec/#{lib}.git", :branch => branch
  end
end

gem 'yard', '0.8.7.4', :require => false

### deps for rdoc.info
group :documentation do
  gem 'redcarpet',     '2.1.1',   :platform => :mri
  gem 'github-markup', '0.7.2'
end

gem 'simplecov'

platforms :jruby do
  gem "jruby-openssl"
end

platforms :rbx do
  gem 'rubysl'
end

# There is no platform :ruby_193 and Rubocop only supports >= 1.9.3
unless RUBY_VERSION == "1.9.2"
  gem "rubocop",
    "~> 0.32.1",
    :platform => [:ruby_19, :ruby_20, :ruby_21, :ruby_22]
end

eval File.read('Gemfile-custom') if File.exist?('Gemfile-custom')
