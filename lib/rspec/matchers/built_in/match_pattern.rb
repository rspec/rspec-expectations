module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `match_pattern`.
      # Not intended to be instantiated directly.
      class MatchPattern < BaseMatcher
        def match(expected, actual) # rubocop:disable Lint/UnusedMethodArgument
          raise_not_supported_ruby_version_error unless supported_ruby_version?

          begin
            instance_eval(<<~RUBY, __FILE__, __LINE__ + 1)
              actual in #{expected.inspect}
            RUBY
          rescue SyntaxError
            raise_invalid_pattern_error
          end
        end

        def failure_message
          "expected #{description_of(@actual)} to match pattern #{@expected.inspect}"
        end

        def failure_message_when_negated
          "expected #{description_of(@actual)} not to match pattern #{@expected.inspect}"
        end

        private

        def raise_invalid_pattern_error
          raise SyntaxError, "The #{matcher_name} matcher requires that " \
                               "the expected object can be used as Ruby's " \
                               "pattern-matching but a `SyntaxError` was raised instead."
        end

        def raise_not_supported_ruby_version_error
          raise NotImplementedError, "The #{matcher_name} matcher is only " \
                                     "supported on Ruby 3 or higher."
        end

        def supported_ruby_version?
          RUBY_VERSION.to_f >= 3.0
        end
      end
    end
  end
end
