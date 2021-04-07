module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `eq`.
      # Not intended to be instantiated directly.
      class Eq < BaseMatcher
        # @api private
        # @return [String]
        def failure_message
          maybe_diff = ""
          if (expected.nil? || expected.is_a?(Numeric)) && (actual.nil? || actual.is_a?(Numeric))
            maybe_diff = "\n    diff: #{(expected || 0) - (actual || 0)}"
          end
          "\nexpected: #{expected_formatted}\n     got: #{actual_formatted}#{maybe_diff}\n\n(compared using ==)\n"
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          "\nexpected: value != #{expected_formatted}\n     got: #{actual_formatted}\n\n(compared using ==)\n"
        end

        # @api private
        # @return [String]
        def description
          "eq #{expected_formatted}"
        end

        # @api private
        # @return [Boolean]
        def diffable?
          true
        end

      private

        def match(expected, actual)
          actual == expected
        end
      end
    end
  end
end
