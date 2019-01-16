module RSpec
  module Expectations
    class << self
      # @private
      class Differ
        # @private
        OBJECT_PREPARER = lambda do |object|
          RSpec::Matchers::Composable.surface_descriptions_in(object)
        end
      end

      # @private
      def differ
        RSpec::Support::Differ.new(
          :object_preparer => Differ::OBJECT_PREPARER,
          :color => RSpec::Matchers.configuration.color?
        )
      end

      # Raises an RSpec::Expectations::ExpectationNotMetError with message.
      # @param [String] message
      # @param [Object] matcher
      #
      # Adds a diff to the failure message when `matcher.expected` and `matcher.actual` are
      # both present.
      def fail_with(message, matcher=nil)
        unless message
          raise ArgumentError, "Failure message is nil. Does your matcher define the " \
                               "appropriate failure_message[_when_negated] method to return a string?"
        end

        message = if !matcher.nil?
          ::RSpec::Matchers::ExpectedsForMultipleDiffs.from(matcher.expected).message_with_diff(message, differ, matcher.actual)
        else
          ::RSpec::Matchers::ExpectedsForMultipleDiffs.from(nil).message_with_diff(message, differ, nil)
        end

        RSpec::Support.notify_failure(RSpec::Expectations::ExpectationNotMetError.new message)
      end
    end
  end
end
