Around "@skip-when-ripper-unsupported" do |scenario, block|
  require 'rspec/support/ruby_features'

  if ::RSpec::Support::RubyFeatures.ripper_supported?
    block.call
  else
    warn "Skipping scenario #{scenario.title} because Ripper is not supported"
  end
end
