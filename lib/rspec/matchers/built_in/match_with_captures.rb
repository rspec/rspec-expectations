module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Extends Match behavior to also match against expected captures
      class MatchWithCaptures < Match
        def initialize(expected, captures)
          super(expected)
          @expected_captures = captures
        end

        # @api private
        # @return [String]
        def description
          "#{super} with captures #{surface_descriptions_in(@expected_captures).inspect}"
        end

      private

        def match(expected, actual)
          (match = super) && values_match?(@expected_captures, actual_captures(match))
        end

        def actual_captures(match_data)
          ReliableMatchData.new(match_data).captures
        end
      end

      # @api private
      # Extends MatchWithCaptures behavior to match against *named* captures
      class MatchWithNamedCaptures < MatchWithCaptures
      private

        def actual_captures(match_data)
          ReliableMatchData.new(match_data).named_captures
        end
      end

      # @api private
      # Used to wrap match data and make it reliable for 1.8.7
      class ReliableMatchData
        def initialize(match_data)
          @match_data = match_data
        end

        # @api private
        # returns an array of captures from the match data
        # @return Array
        def captures
          @match_data.captures
        end

        if RUBY_VERSION == "1.8.7"
          # @api private
          # Returns match data names for named captures
          # @return Array
          def names
            []
          end
        else
          # @api private
          # Returns match data names for named captures
          # @return Array
          def names
            @match_data.names
          end
        end

        # @api private
        # returns a hash of named captures from the match data
        # @return Hash
        def named_captures
          Hash[names.map.zip(captures)]
        end
      end
    end
  end
end
