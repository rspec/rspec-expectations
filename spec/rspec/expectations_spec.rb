require 'rspec/support/spec/library_wide_checks'

RSpec.describe "RSpec::Expectations" do
  options = {
    :preamble_for_lib => [
      # We define minitest constants because rspec/expectations/minitest_integration
      # expects these constants to already be defined.
      "module Minitest; class Assertion; end; module Test; end; end",
      'require "rspec/expectations"'
    ],
    :allowed_loaded_feature_regexps => [
      /stringio/, # Used by `output` matcher. Can't be easily avoided.
      /rbconfig/  # required by rspec-support
    ]
  }

  if RUBY_VERSION.to_f >= 2.7
    it_behaves_like "library wide checks", "rspec-expectations", options
  else
    options.merge!(
      :consider_a_test_env_file => File.expand_path("../../../lib/rspec/matchers/dsl27.rb", __FILE__),
      :skip_spec_files => /dsl27/
    )

    it_behaves_like "library wide checks", "rspec-expectations", options
  end

  it 'does not allow expectation failures to be caught by a bare rescue' do
    expect {
      expect(2).to eq(3) rescue nil
    }.to fail_including("expected: 3")
  end
end
