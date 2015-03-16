RSpec::Support.require_rspec_support('object_inspector')

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
          "\nexpected: #{format_object(expected)}\n     got: #{format_object(actual)}\n\n(compared using ==)\n"
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          "\nexpected: value != #{format_object(expected)}\n     got: #{format_object(actual)}\n\n(compared using ==)\n"
        end

        # @api private
        # @return [String]
        def description
          "eq #{@expected.inspect}"
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

        def format_object(object)
          RSpec::Support::ObjectInspector.inspect(object)
        end
      end
    end
  end
end
