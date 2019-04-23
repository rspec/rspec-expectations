module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `be_an_instance_of`.
      # Not intended to be instantiated directly.
      class BeAnInstanceOf < BaseMatcher
        # @api private
        # @return [String]
        def description
          "be an instance of #{expected}"
        end

      private

        def match(expected, actual)
          result = nil
          if executable? { result = actual.instance_of?(expected) }
            result
          else
            raise ::ArgumentError, "The #{matcher_name} matcher requires that " \
                                   "the actual object responds to #instance_of? method " \
                                   "but it does not respond to the method."
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
