module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `return_value`.
      # Not intended to be instantiated directly.
      class ReturnValue < BaseMatcher
        def initialize(expected)
          @expected        = expected
          @actual          = nil
          @block           = nil
        end

        def matches?(event_proc, &block)
          return false unless Proc === event_proc

          # TODO: what can be passed as a block? return_value { ... } ? why?
          # return false unless Proc === block

          @actual = event_proc.call
          # raise_block_syntax_error if block_given?
          # perform_change(event_proc) && change_details.changed?
          values_match?(@expected, @actual)
        end

        # TODO: &blck
        def does_not_match?(block)
          !matches?(block) && Proc === block
        end

        # @api private
        # @return [String]
        def failure_message
          "expected block to #{description}, but returned #{@actual}"
          # TODO: better description when @actual is a matcher
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          # TODO
        end

        # @api private
        # @return [String]
        def description
          "return #{@expected}"
        end

        # @api private
        # @return [Boolean]
        def diffable?
          true
        end

        # @api private
        # Indicates this matcher matches against a block.
        # @return [True]
        def supports_block_expectations?
          true
        end

        # @api private
        # Indicates this matcher matches against a block only.
        # @return [False]
        def supports_value_expectations?
          false
        end
      end
    end
  end
end
