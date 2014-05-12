module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Wraps and negates a matcher
      class Negation < BaseMatcher

        # @private
        attr_reader :matcher

        def initialize(matcher)
          @matcher = matcher
        end

        # Return the original matcher when negated twice
        # @example
        #   expect(stoplight.color).to ~~eq("green")
        def ~
          matcher
        end

        # @api private
        # Return the matcher `description_when_negated` method, when implemented.
        # Or defaults to a generic negative description
        def description
          matcher.description
        end

        # @api private
        # @return [String]
        def failure_message
          matcher.failure_message_when_negated
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          matcher.failure_message
        end

        # @private
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

        def initialize_copy(other)
          @matcher = @matcher.clone
          super
        end

      end
    end
  end
end
