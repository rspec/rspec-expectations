module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `be_a_subclass_of`.
      # Not intended to be instantiated directly.
      class BeASubclassOf < BaseMatcher
      private

        def match(expected, actual)
          actual.ancestors.include? expected
        end
      end
    end
  end
end
