module RSpec
  module Expectations
    # @private
    module ExpectationHelper
      def self.check_message(msg)
        unless msg.nil? || msg.respond_to?(:to_str) || msg.respond_to?(:call)
          ::Kernel.warn [
            "WARNING: ignoring the provided expectation message argument (",
            msg.inspect,
            ") since it is not a string or a proc."
          ].join
        end
      end

      def self.with_matcher(handler, matcher, message)
        check_message(message)
        yield matcher
      ensure
        ::RSpec::Matchers.last_expectation_handler = handler
        ::RSpec::Matchers.last_matcher = matcher
      end

      def self.handle_failure(matcher, message, failure_message_method)
        message = message.call if message.respond_to?(:call)
        message ||= matcher.__send__(failure_message_method)

        if matcher.respond_to?(:diffable?) && matcher.diffable?
          ::RSpec::Expectations.fail_with message, matcher.expected, matcher.actual
        else
          ::RSpec::Expectations.fail_with message
        end
      end
    end

    # @private
    class PositiveExpectationHandler
      def self.handle_matcher(actual, initial_matcher, custom_message=nil, &block)
        ExpectationHelper.with_matcher(self, initial_matcher, custom_message) do |matcher|
          match_result = matcher.matches?(actual, &block)
          if custom_message && match_result.respond_to?(:error_generator)
            match_result.error_generator.opts[:message] = custom_message
          end

          match_result || ExpectationHelper.handle_failure(matcher, custom_message, :failure_message)
        end
      end

      def self.verb
        'is expected to'
      end

      def self.should_method
        :should
      end

      def self.opposite_should_method
        :should_not
      end
    end

    # @private
    class NegativeExpectationHandler
      def self.handle_matcher(actual, initial_matcher, custom_message=nil, &block)
        ExpectationHelper.with_matcher(self, initial_matcher, custom_message) do |matcher|
          negated_match_result = does_not_match?(matcher, actual, &block)
          if custom_message && negated_match_result.respond_to?(:error_generator)
            negated_match_result.error_generator.opts[:message] = custom_message
          end

          negated_match_result || ExpectationHelper.handle_failure(matcher, custom_message, :failure_message_when_negated)
        end
      end

      def self.does_not_match?(matcher, actual, &block)
        if matcher.respond_to?(:does_not_match?)
          matcher.does_not_match?(actual, &block)
        else
          !matcher.matches?(actual, &block)
        end
      end

      def self.verb
        'is expected not to'
      end

      def self.should_method
        :should_not
      end

      def self.opposite_should_method
        :should
      end
    end
  end
end
