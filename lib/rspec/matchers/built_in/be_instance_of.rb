module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `be_an_instance_of`.
      # Not intended to be instantiated directly.
      class BeAnInstanceOf < BaseMatcher
        def initialize(*)
          super
          @no_checker_implemented = false
        end

        # @api private
        # @return [String]
        def description
          "be an instance of #{expected}"
        end

        # @api private
        # @return [Boolean]
        def matches?(actual)
          @actual = actual
          result = match(expected, actual)
          @no_checker_implemented ? false : result
        end

        # @api private
        # @return [Boolean]
        def does_not_match?(actual)
          @actual = actual
          result = match(expected, actual)
          @no_checker_implemented ? false : !result
        end

        # @api private
        # @return [String]
        def failure_message
          if @no_checker_implemented
            warning_message
          else
            super
          end
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          if @no_checker_implemented
            warning_message
          else
            super
          end
        end

      private

        def match(expected, actual)
          if actual_object_respond_to?(actual, :instance_of?)
            actual.instance_of?(expected)
          else
            @no_checker_implemented = true
          end
        end

        def actual_object_respond_to?(actual, method)
          ::Kernel.instance_method(:respond_to?).bind(actual).call(method)
        end

        def warning_message
          "The #{matcher_name} matcher requires that the actual object " \
          "responds to #instance_of? method but it does not respond to " \
          "the method."
        end
      end
    end
  end
end
