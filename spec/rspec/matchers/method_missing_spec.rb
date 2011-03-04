require 'spec_helper'

RSpec.configure do |c|
  c.include RSpec::Matchers, :include_rspec_matchers_an_extra_time => true
end

describe "method_missing" do
  shared_examples_for "a well-behaved method_missing hook" do
    it "allows undefined methods to raise errors as normal" do
      expect { some_undefined_method }.to raise_error(NameError)
    end
  end

  it_behaves_like "a well-behaved method_missing hook"

  context "when RSpec::Matchers has been included in an example group" do
    include RSpec::Matchers
    it_behaves_like "a well-behaved method_missing hook"
  end

  context "when a module that includes RSpec::Matchers has been included in an example group" do
    include Module.new { include RSpec::Matchers }
    it_behaves_like "a well-behaved method_missing hook"
  end

  context "when a group is configured to include RSpec::Matchers an extra time", :include_rspec_matchers_an_extra_time => true do
    it_behaves_like "a well-behaved method_missing hook"
  end
end
