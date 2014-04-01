module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Wraps and negates a matcher
      class Negation < BaseMatcher
        attr_reader :matcher

        def initialize(matcher)
          @matcher = matcher
        end

        # return the original matcher when negated twice
        # @example
        #   expect(stoplight.color).to ~~eq("green")
        def ~
          matcher
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

        def does_not_match?(actual)
          matcher.matches?(actual)
        end

      private

        def match(_, actual)
          if matcher.respond_to?(:does_not_match?)
            matcher.does_not_match?(actual)
          else
            !matcher.matches?(actual)
          end
        end

      end
    end
  end
end
