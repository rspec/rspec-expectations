module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `be_a_kind_of`.
      # Not intended to be instantiated directly.
      class BeAKindOf < BaseMatcher
      private

        def match(expected, actual)
          if executable?(actual, :kind_of?, expected)
            actual.kind_of?(expected)
          elsif executable?(actual, :is_a?, expected)
            actual.is_a?(expected)
          else
            raise ::ArgumentError, "The #{matcher_name} matcher requires that " \
                                   "the actual object responds to either #kind_of? or #is_a? methods " \
                                   "but a `NoMethodError` was encountered instead."
          end
        end

        def executable?(object, method, *args)
          object.public_send(method, *args)
          true
        rescue NoMethodError
          false
        end
      end
    end
  end
end
