module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `be_a_kind_of`.
      # Not intended to be instantiated directly.
      class BeAKindOf < BaseMatcher
      private

        def match(expected, actual)
          result = nil
          if executable? { result = actual.kind_of?(expected) }
            result
          elsif executable? { result = actual.is_a?(expected) }
            result
          else
            raise ::ArgumentError, "The #{matcher_name} matcher requires that " \
                                   "the actual object responds to either #kind_of? or #is_a? methods " \
                                   "but a `NoMethodError` was encountered instead."
          end
        end

        def executable?
          yield
          true
        rescue NoMethodError
          false
        end
      end
    end
  end
end
