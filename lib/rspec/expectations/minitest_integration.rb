require 'rspec/expectations'

Minitest::Test.class_eval do
  include ::RSpec::Matchers

  def expect(*a, &b)
    assert(true) # so each expectation gets counted in minitest's assertion stats
    super
  end
end

module RSpec
  module Expectations
    remove_const :ExpectationNotMetError

    # Exception raised when an expectation fails.
    #
    # @note we subclass `Exception` in `rspec-expectations` normally but
    # when integrating with minitest it makes more sense to use their
    # assertion constant.
    #
    # @api public
    ExpectationNotMetError = ::Minitest::Assertion
  end
end
