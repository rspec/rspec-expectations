module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `match`.
      # Not intended to be instantiated directly.
      class Match < BaseMatcher
        # @api private
        # @return [String]
        def description
          "match #{surface_descriptions_in(expected).inspect}"
        end

        # @api private
        # @return [Boolean]
        def diffable?
          true
        end

        # Used to specify the captures we match against
        # @return [self]
        def with_captures(*captures)
          expected_captures = ExpectedCaptures.new(captures.last)

          if expected_captures.named?
            MatchWithNamedCaptures.new @expected, expected_captures.stringify_keys
          else
            MatchWithCaptures.new @expected, captures
          end
        end

      private

        def match(expected, actual)
          if can_safely_call_match?(expected, actual)
            actual.match(expected)
          else
            values_match?(expected, actual)
          end
        end

        def can_safely_call_match?(expected, actual)
          return false unless actual.respond_to?(:match)
          return false if Regexp === expected && Regexp === actual

          !(RSpec::Matchers.is_a_matcher?(expected) &&
            (String === actual || Regexp === actual))
        end

        class ExpectedCaptures
          def initialize(captures)
            @captures = captures
          end

          def named?
            Hash === @captures || is_a_hash_matcher?
          end

          def stringify_keys
            captures_hash.replace captures_hash.reduce({}) {|h, (k, v)| h[k.to_s] = v; h }
            @captures
          end

          private

          def is_a_hash_matcher?
            RSpec::Matchers.is_a_matcher?(@captures) &&
              @captures.expected.respond_to?(:first) &&
              Hash === @captures.expected.first
          end

          def captures_hash
            is_a_hash_matcher? ? @captures.expected.first : @captures
          end
        end
      end
    end
  end
end
