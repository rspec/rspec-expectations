module RSpec
  module Expectations
    # Value object holding information about an expectation failure.
    # Returned by FailureAggregator instead of raising an exception.
    # @private
    class AggregatedFailure < Object
      class << self
        attr_accessor :instance
      end

      private_class_method :new

      def self.build(failure)
        new(failure).freeze
      end

      def initialize(failure)
        @failure = failure
      end

      def inspect
        "AggregatedFailure: #{@failure}"
      end
    end
  end
end
