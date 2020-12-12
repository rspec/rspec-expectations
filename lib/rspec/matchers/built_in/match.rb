module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `match`.
      # Not intended to be instantiated directly.
      class Match < BaseMatcher
        def initialize(expected)
          super(expected)

          @expected_captures = nil
        end
        # @api private
        # @return [String]
        def description
          if @expected_captures && @expected.match(actual)
            "match #{surface_descriptions_in(expected).inspect} with captures #{surface_descriptions_in(@expected_captures).inspect}"
          else
            "match #{surface_descriptions_in(expected).inspect}"
          end
        end

        # @api private
        # @return [Boolean]
        def diffable?
          true
        end

        # Used to specify the captures we match against
        # @return [self]
        def with_captures(*captures)
          @expected_captures = captures
          self
        end

      private

        def match(expected, actual)
          return match_captures(expected, actual) if @expected_captures
          return true if values_match?(expected, actual)
          return false unless can_safely_call_match?(expected, actual)
          actual.match(expected)
        end

        def can_safely_call_match?(expected, actual)
          return false unless actual.respond_to?(:match)

          !(RSpec::Matchers.is_a_matcher?(expected) &&
            (String === actual || Regexp === actual))
        end

        def match_captures(expected, actual)
          match = actual.match(expected)
          if match
            if match.names.empty?
              values_match?(@expected_captures, match.captures)
            else
              expected_matcher = @expected_captures.last
              values_match?(expected_matcher, Hash[match.names.zip(match.captures)]) ||
                values_match?(expected_matcher, Hash[match.names.map(&:to_sym).zip(match.captures)]) ||
                values_match?(@expected_captures, match.captures)
            end
          else
            false
          end
        end
      end
    end
  end
end
