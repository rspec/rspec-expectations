module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Base class for `~` and `!` compound matchers.
      class Negation < BaseMatcher
        attr_reader :matcher

        def initialize(matcher)
          @matcher = matcher
        end

        def description
          "not #{matcher.description}"
        end

        def failure_message
          matcher.failure_message_when_negated
        end

        def failure_message_when_negated
          matcher.failure_message
        end

      private

        def match(_, actual)
          if matcher.matches?(actual)
            false
          else
            true
          end
        end

        def does_not_match?(actual)
          matcher.matches?(actual)
        end

      end
    end
  end
end

