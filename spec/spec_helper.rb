require 'rspec/support/spec'
require 'rspec/support/spec/in_sub_process'

RSpec::Support::Spec.setup_simplecov do
  minimum_coverage 91
end

Dir['./spec/support/**/*'].each do |f|
  require f.sub(%r{\./spec/}, '')
end

module CommonHelperMethods
  def with_env_vars(vars)
    original = ENV.to_hash
    vars.each { |k, v| ENV[k] = v }

    begin
      yield
    ensure
      ENV.replace(original)
    end
  end

  def dedent(string)
    string.gsub(/^\s+\|/, '').chomp
  end

  def hash_inspect(hash)
    RSpec::Matchers::BuiltIn::BaseMatcher::HashFormatting.
      improve_hash_formatting hash.inspect
  end
end

RSpec.configure do |config|
  config.color = true
  config.order = :random

  config.include CommonHelperMethods
  config.include RSpec::Support::InSubProcess

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # We don't want rspec-core to look in our `lib` for failure snippets.
  # When it does that, it inevitably finds this line:
  # `RSpec::Support.notify_failure(RSpec::Expectations::ExpectationNotMetError.new message)`
  # ...which isn't very helpful. Far better for it to find the expectation
  # call site in the spec.
  config.project_source_dirs -= ["lib"]
end

RSpec.shared_context "isolate include_chain_clauses_in_custom_matcher_descriptions" do
  around do |ex|
    orig = RSpec::Expectations.configuration.include_chain_clauses_in_custom_matcher_descriptions?
    ex.run
    RSpec::Expectations.configuration.include_chain_clauses_in_custom_matcher_descriptions = orig
  end
end

RSpec.shared_context "with warn_about_potential_false_positives set to false" do
  original_value = RSpec::Expectations.configuration.warn_about_potential_false_positives?

  after(:context)  { RSpec::Expectations.configuration.warn_about_potential_false_positives = original_value }
end
RSpec.configuration.include_context "with warn_about_potential_false_positives set to false", :warn_about_potential_false_positives

RSpec.shared_context "with modified configuration" do
  around do |example|
    configuration = example.metadata[:with_configuration]
    # Rework to use `slice` when we drop support for Ruby 2.3
    original = configuration.keys.each.with_object({}) do |key, config|
      config[key] = RSpec::Expectations.configuration.public_send(key)
    end
    configuration.each do |key, value|
      RSpec::Expectations.configuration.public_send("#{key}=", value)
    end
    example.run
    original.each do |key, value|
      RSpec::Expectations.configuration.public_send("#{key}=", value)
    end
  end
end
RSpec.configuration.include_context "with modified configuration", :with_configuration

module MinitestIntegration
  include ::RSpec::Support::InSubProcess

  def with_minitest_loaded
    in_sub_process do
      with_isolated_stderr do
        require 'minitest/autorun'
      end

      require 'rspec/expectations/minitest_integration'
      yield
    end
  end
end

RSpec::Matchers.define_negated_matcher :avoid_outputting, :output
