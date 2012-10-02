module RSpec
  module Expectations

    class ExpectationHandler
      def self.message_must_be_string
        "The value passed as the message for the expectation was not a string"
      end

      def self.check_message(message=nil)
        throw message_must_be_string unless message.is_a? String or message == nil
      end
    end

    class PositiveExpectationHandler < ExpectationHandler

      def self.handle_matcher(actual, matcher, message=nil, &block)
        check_message(message)
        ::RSpec::Matchers.last_should = :should
        ::RSpec::Matchers.last_matcher = matcher
        return ::RSpec::Matchers::BuiltIn::PositiveOperatorMatcher.new(actual) if matcher.nil?

        match = matcher.matches?(actual, &block)
        return match if match

        message ||= matcher.respond_to?(:failure_message_for_should) ?
                    matcher.failure_message_for_should :
                    matcher.failure_message

        if matcher.respond_to?(:diffable?) && matcher.diffable?
          ::RSpec::Expectations.fail_with message, matcher.expected, matcher.actual
        else
          ::RSpec::Expectations.fail_with message
        end
      end
    end

    class NegativeExpectationHandler < ExpectationHandler
      def self.handle_matcher(actual, matcher, message=nil, &block)
        check_message(message)
        ::RSpec::Matchers.last_should = :should_not
        ::RSpec::Matchers.last_matcher = matcher
        return ::RSpec::Matchers::BuiltIn::NegativeOperatorMatcher.new(actual) if matcher.nil?

        match = matcher.respond_to?(:does_not_match?) ?
                !matcher.does_not_match?(actual, &block) :
                matcher.matches?(actual, &block)
        return match unless match

        message ||= matcher.respond_to?(:failure_message_for_should_not) ?
                    matcher.failure_message_for_should_not :
                    matcher.negative_failure_message

        if matcher.respond_to?(:diffable?) && matcher.diffable?
          ::RSpec::Expectations.fail_with message, matcher.expected, matcher.actual
        else
          ::RSpec::Expectations.fail_with message
        end
      end
    end
  end
end

