module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `be_a_kind_of`.
      # Not intended to be instantiated directly.
      class BeAKindOf < BaseMatcher
        def initialize(*)
          super
          @no_checkers_implemented = false
        end

        # @api private
        # @return [Boolean]
        def matches?(actual)
          @actual = actual
          result = match(expected, actual)
          @no_checkers_implemented ? false : result
        end

        # @api private
        # @return [Boolean]
        def does_not_match?(actual)
          @actual = actual
          result = match(expected, actual)
          @no_checkers_implemented ? false : !result
        end

        # @api private
        # @return [String]
        def failure_message
          if @no_checkers_implemented
            warning_message
          else
            super
          end
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          if @no_checkers_implemented
            warning_message
          else
            super
          end
        end

      private

        def match(expected, actual)
          if actual_object_respond_to?(actual, :kind_of?)
            actual.kind_of?(expected)
          elsif actual_object_respond_to?(actual, :is_a?)
            actual.is_a?(expected)
          else
            @no_checkers_implemented = true
          end
        end

        def actual_object_respond_to?(actual, method)
          ::Kernel.instance_method(:respond_to?).bind(actual).call(method)
        end

        def warning_message
          "The #{matcher_name} matcher requires that the actual object " \
          "responds to either #kind_of? or #is_a? methods but " \
          "it responds to neigher of two methods."
        end
      end
    end
  end
end
