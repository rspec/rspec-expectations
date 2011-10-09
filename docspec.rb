Dir.chdir(File.join(File.dirname(__FILE__), *%w[.. example_rails_app vendor plugins rspec])) do
  puts `bin/spec #{ARGV.first}`
end