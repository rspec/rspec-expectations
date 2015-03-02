require "spec_helper"
RSpec::Support.require_rspec_matchers "pairings_maximizer"

module RSpec
  module Matchers
    RSpec.describe PairingsMaximizer do
      it 'finds unmatched expected indexes' do
        maximizer = PairingsMaximizer.new({ 0 => [], 1 => [0] }, { 0 => [1] })
        expect(maximizer.solution.unmatched_expected_indexes).to eq([0])
      end

      it 'finds unmatched actual indexes' do
        maximizer = PairingsMaximizer.new({ 0 => [0] }, { 0 => [0], 1 => [] })
        expect(maximizer.solution.unmatched_actual_indexes).to eq([1])
      end

      describe "finding indeterminate indexes" do
        it 'does not include unmatched indexes' do
          maximizer = PairingsMaximizer.new({ 0 => [], 1 => [0] }, { 0 => [1], 1 => [] })

          expect(maximizer.solution.indeterminate_expected_indexes).not_to include(0)
          expect(maximizer.solution.indeterminate_actual_indexes).not_to include(1)
        end

        it 'does not include indexes that are reciprocally to exactly one index' do
          maximizer = PairingsMaximizer.new({ 0 => [], 1 => [0] }, { 0 => [1], 1 => [0] })

          expect(maximizer.solution.indeterminate_expected_indexes).not_to include(1)
          expect(maximizer.solution.indeterminate_actual_indexes).not_to include(0)
        end

        it 'includes indexes that have multiple matches' do
          maximizer = PairingsMaximizer.new({ 0 => [0, 2], 1 => [0, 2], 2 => [] },
                                            { 0 => [0, 1], 1 => [], 2 => [0, 1] })


          expect(maximizer.solution.indeterminate_expected_indexes).to include(0, 1)
          expect(maximizer.solution.indeterminate_actual_indexes).to include(0, 2)
        end

        it 'includes indexes that have one match which has multiple matches' do
          maximizer = PairingsMaximizer.new({ 0 => [0], 1 => [0], 2 => [1, 2] },
                                            { 0 => [0, 1], 1 => [2], 2 => [2] })

          expect(maximizer.solution.indeterminate_expected_indexes).to include(0, 1)
          expect(maximizer.solution.indeterminate_actual_indexes).to include(1, 2)
        end
      end

      describe "#unmatched_item_count" do
        it 'returns the count of unmatched items' do
          maximizer = PairingsMaximizer.new({ 0 => [1], 1 => [0] },
                                            { 0 => [1], 1 => [0] })
          expect(maximizer.solution.unmatched_item_count).to eq(0)

          maximizer = PairingsMaximizer.new({ 0 => [1], 1 => [0] },
                                            { 0 => [1], 1 => [0], 2 => [] })
          expect(maximizer.solution.unmatched_item_count).to eq(1)
        end
      end

      describe "#find_best_solution" do
        matcher :produce_result do |unmatched_expected, unmatched_actual|
          match do |result|
            result.candidate? &&
              result.unmatched_expected_indexes == unmatched_expected &&
              result.unmatched_actual_indexes   == unmatched_actual
          end

          failure_message do |result|
            if result.candidate_result?
              "expected a complete solution, but still had indeterminate indexes: " +
                "expected: #{result.indeterminate_expected_indexes.inspect}; " +
              "actual: #{result.indeterminate_actual_indexes.inspect}"
            elsif result.unmatched_expected_indexes != unmatched_expected
              "expected unmatched_expected_indexes: #{unmatched_expected.inspect} " +
              "but got: #{result.unmatched_expected_indexes.inspect}"
            elsif result.unmatched_actual_indexes != unmatched_actual
              "expected unmatched_actual_indexes: #{unmatched_actual.inspect} " +
              "but got: #{result.unmatched_actual_indexes.inspect}"
            end
          end
        end

        it 'returns no unmatched indexes when everything reciprocally matches one item' do
          maximizer = PairingsMaximizer.new({ 0 => [1], 1 => [0] },
                                            { 0 => [1], 1 => [0] })
          expect(maximizer.find_best_solution).to produce_result([], [])
        end

        it 'returns unmatched indexes for everything that has no matches' do
          maximizer = PairingsMaximizer.new({ 0 => [], 1 => [0] },
                                            { 0 => [1], 1 => [] })
          expect(maximizer.find_best_solution).to produce_result([0], [1])
        end

        it 'searches the solution space for a perfectly matching solution' do
          maximizer = PairingsMaximizer.new({ 0 => [0, 1], 1 => [0] },
                                            { 0 => [0, 1], 1 => [0] })
          expect(maximizer.find_best_solution).to produce_result([], [])
        end
      end
    end
  end
end
