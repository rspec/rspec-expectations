Before "@skip-when-ripper-unsupported" do |scenario|
  require 'rspec/support/ruby_features'

  unless ::RSpec::Support::RubyFeatures.ripper_supported?
    warn "Skipping scenario #{scenario.name} because Ripper is not supported"
    skip_this_scenario
  end
end
