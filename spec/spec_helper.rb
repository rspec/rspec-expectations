Dir['./spec/support/**/*'].each {|f| require f}

module DeprecationHelpers
  def allow_deprecation
    allow(RSpec.configuration.reporter).to receive(:deprecation)
  end

  def expect_deprecation_with_call_site(file, line, snippet = //)
    expect(RSpec.configuration.reporter).to receive(:deprecation) do |options|
      matcher = include([file, line].join(':'))
      call_site = options[:call_site] || options[:message]

      unless matcher.matches?(call_site)
        # RSpec::Expectations::ExpectationNotMetError is rescued in the `match` block
        # of a custom matcher and returned as `false` from `matches?`. This would
        # prevent an expectation failure here from surfacing in the test suite if
        # it's triggered from within a `match` block, so we need to raise
        # a different error class instead.
        raise matcher.failure_message_for_should
      end

      deprecated = options[:deprecated] || options[:message]
      expect(deprecated).to match(snippet)
    end
  end
end

RSpec::configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.color_enabled = true
  config.filter_run :focused
  config.run_all_when_everything_filtered = true
  config.order = :random

  config.expect_with :rspec do |expectations|
    $default_expectation_syntax = expectations.syntax
    expectations.syntax = :expect
  end

  config.include SpecHelperMethods
  config.include DeprecationHelpers
end

shared_context "with #should enabled", :uses_should do
  orig_syntax = nil

  before(:all) do
    orig_syntax = RSpec::Matchers.configuration.syntax
    RSpec::Matchers.configuration.syntax = [:expect, :should]
  end

  after(:all) do
    RSpec::Matchers.configuration.syntax = orig_syntax
  end
end


shared_context "with #should exclusively enabled", :uses_only_should do
  orig_syntax = nil

  before(:all) do
    orig_syntax = RSpec::Matchers.configuration.syntax
    RSpec::Matchers.configuration.syntax = :should
  end

  after(:all) do
    RSpec::Matchers.configuration.syntax = orig_syntax
  end
end

module TestUnitIntegrationSupport
  include InSubProcess

  def with_test_unit_loaded
    in_sub_process do
      require 'test/unit'
      load 'rspec/matchers/test_unit_integration.rb'
      yield
    end
  end
end

