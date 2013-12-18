module RSpec
  module Expectations

    # @api private
    class ExpectationHelper
      def self.check_message(msg)
        unless msg.nil? || msg.respond_to?(:to_str) || msg.respond_to?(:call)
          ::Kernel.warn [
            "WARNING: ignoring the provided expectation message argument (",
            msg.inspect,
            ") since it is not a string or a proc."
          ].join
        end
      end

      # Returns an RSpec-3+ compatible matcher, wrapping a legacy one
      # in an adapter if necessary.
      #
      # @api private
      def self.modern_matcher_from(matcher)
        LegacyMacherAdapter::RSpec2.wrap(matcher) ||
        LegacyMacherAdapter::RSpec1.wrap(matcher) || matcher
      end

      def self.setup(handler, matcher, message)
        check_message(message)
        ::RSpec::Matchers.last_expectation_handler = handler
        ::RSpec::Matchers.last_matcher = modern_matcher_from(matcher)
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

    # @api private
    class PositiveExpectationHandler
      def self.handle_matcher(actual, initial_matcher, message=nil, &block)
        matcher = ExpectationHelper.setup(self, initial_matcher, message)

        return ::RSpec::Matchers::BuiltIn::PositiveOperatorMatcher.new(actual) unless initial_matcher
        matcher.matches?(actual, &block) or ExpectationHelper.handle_failure(matcher, message, :failure_message)
      end

      def self.verb
        "should"
      end

      def self.should_method
        :should
      end

      def self.opposite_should_method
        :should_not
      end
    end

    # @api private
    class NegativeExpectationHandler
      def self.handle_matcher(actual, initial_matcher, message=nil, &block)
        matcher = ExpectationHelper.setup(self, initial_matcher, message)

        return ::RSpec::Matchers::BuiltIn::NegativeOperatorMatcher.new(actual) unless initial_matcher
        !(does_not_match?(matcher, actual, &block) or ExpectationHelper.handle_failure(matcher, message, :failure_message_when_negated))
      end

      def self.does_not_match?(matcher, actual, &block)
        if matcher.respond_to?(:does_not_match?)
          matcher.does_not_match?(actual, &block)
        else
          !matcher.matches?(actual, &block)
        end
      end

      def self.verb
        "should not"
      end

      def self.should_method
        :should_not
      end

      def self.opposite_should_method
        :should
      end
    end

    # Wraps a matcher written against one of the legacy protocols in
    # order to present the current protocol.
    #
    # @api private
    class LegacyMacherAdapter < Matchers::MatcherDelegator
      def initialize(matcher)
        super
        ::RSpec.warn_deprecation(<<-EOS.gsub(/^\s+\|/, ''))
          |--------------------------------------------------------------------------
          |#{matcher.class.name || matcher.inspect} implements a legacy RSpec matcher
          |protocol. For the current protocol you should expose the failure messages
          |via the `failure_message` and `failure_message_when_negated` methods.
          |(Used from #{CallerFilter.first_non_rspec_line})
          |--------------------------------------------------------------------------
        EOS
      end

      def self.wrap(matcher)
        new(matcher) if interface_matches?(matcher)
      end

      # Starting in RSpec 1.2 (and continuing through all 2.x releases),
      # the failure message protocol was:
      #   * `failure_message_for_should`
      #   * `failure_message_for_should_not`
      # @api private
      class RSpec2 < self
        def failure_message
          base_matcher.failure_message_for_should
        end

        def failure_message_when_negated
          base_matcher.failure_message_for_should_not
        end

        def self.interface_matches?(matcher)
          (
            !matcher.respond_to?(:failure_message) &&
            matcher.respond_to?(:failure_message_for_should)
          ) || (
            !matcher.respond_to?(:failure_message_when_negated) &&
            matcher.respond_to?(:failure_message_for_should_not)
          )
        end
      end

      # Before RSpec 1.2, the failure message protocol was:
      #   * `failure_message`
      #   * `negative_failure_message`
      # @api private
      class RSpec1 < self
        def failure_message
          base_matcher.failure_message
        end

        def failure_message_when_negated
          base_matcher.negative_failure_message
        end

        # Note: `failure_message` is part of the RSpec 3 protocol
        # (paired with `failure_message_when_negated`), so we don't check
        # for `failure_message` here.
        def self.interface_matches?(matcher)
          !matcher.respond_to?(:failure_message_when_negated) &&
          matcher.respond_to?(:negative_failure_message)
        end
      end
    end
  end
end

