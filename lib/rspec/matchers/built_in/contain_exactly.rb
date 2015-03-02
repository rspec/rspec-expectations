RSpec::Support.require_rspec_matchers "pairings_maximizer"

module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `contain_exactly` and `match_array`.
      # Not intended to be instantiated directly.
      class ContainExactly < BaseMatcher
        # @api private
        # @return [String]
        def failure_message
          if Array === actual
            message  = "expected collection contained:  #{safe_sort(surface_descriptions_in expected).inspect}\n"
            message += "actual collection contained:    #{safe_sort(actual).inspect}\n"
            message += "the missing elements were:      #{safe_sort(surface_descriptions_in missing_items).inspect}\n" unless missing_items.empty?
            message += "the extra elements were:        #{safe_sort(extra_items).inspect}\n" unless extra_items.empty?
            message
          else
            "expected a collection that can be converted to an array with " \
            "`#to_ary` or `#to_a`, but got #{actual.inspect}"
          end
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          "expected #{actual.inspect} not to contain exactly#{to_sentence(surface_descriptions_in expected)}"
        end

        # @api private
        # @return [String]
        def description
          "contain exactly#{to_sentence(surface_descriptions_in expected)}"
        end

      private

        def match(_expected, _actual)
          return false unless convert_actual_to_an_array
          match_when_sorted? || (extra_items.empty? && missing_items.empty?)
        end

        # This cannot always work (e.g. when dealing with unsortable items,
        # or matchers as expected items), but it's practically free compared to
        # the slowness of the full matching algorithm, and in common cases this
        # works, so it's worth a try.
        def match_when_sorted?
          values_match?(safe_sort(expected), safe_sort(actual))
        end

        def convert_actual_to_an_array
          if actual.respond_to?(:to_ary)
            @actual = actual.to_ary
          elsif enumerable?(actual) && actual.respond_to?(:to_a)
            @actual = actual.to_a
          else
            return false
          end
        end

        def safe_sort(array)
          array.sort rescue array
        end

        def missing_items
          @missing_items ||= best_solution.unmatched_expected_indices.map do |index|
            expected[index]
          end
        end

        def extra_items
          @extra_items ||= best_solution.unmatched_actual_indices.map do |index|
            actual[index]
          end
        end

        def best_solution
          @best_solution ||= PairingsMaximizer.best_solution(expected, actual, method(:values_match?))
        end
      end
    end
  end
end
