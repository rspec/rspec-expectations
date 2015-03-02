require "spec_helper"
RSpec::Support.require_rspec_matchers "pairings_maximizer"

module RSpec
  module Matchers
    RSpec.describe PairingsMaximizer do
      it 'finds unmatched expected indices' do
        maximizer = PairingsMaximizer.new({ 0 => [], 1 => [0] }, { 0 => [1] })
        expect(maximizer.solution.unmatched_expected_indices).to eq([0])
      end

      it 'finds unmatched actual indices' do
        maximizer = PairingsMaximizer.new({ 0 => [0] }, { 0 => [0], 1 => [] })
        expect(maximizer.solution.unmatched_actual_indices).to eq([1])
      end

      describe "finding indeterminate indices" do
        it 'does not include unmatched indices' do
          maximizer = PairingsMaximizer.new({ 0 => [], 1 => [0] }, { 0 => [1], 1 => [] })

          expect(maximizer.solution.indeterminate_expected_indices).not_to include(0)
          expect(maximizer.solution.indeterminate_actual_indices).not_to include(1)
        end

        it 'does not include indices that are reciprocally to exactly one index' do
          maximizer = PairingsMaximizer.new({ 0 => [], 1 => [0] }, { 0 => [1], 1 => [0] })

          expect(maximizer.solution.indeterminate_expected_indices).not_to include(1)
          expect(maximizer.solution.indeterminate_actual_indices).not_to include(0)
        end

        it 'includes indices that have multiple matches' do
          maximizer = PairingsMaximizer.new({ 0 => [0, 2], 1 => [0, 2], 2 => [] },
                                            { 0 => [0, 1], 1 => [], 2 => [0, 1] })


          expect(maximizer.solution.indeterminate_expected_indices).to include(0, 1)
          expect(maximizer.solution.indeterminate_actual_indices).to include(0, 2)
        end

        it 'includes indices that have one match which has multiple matches' do
          maximizer = PairingsMaximizer.new({ 0 => [0], 1 => [0], 2 => [1, 2] },
                                            { 0 => [0, 1], 1 => [2], 2 => [2] })

          expect(maximizer.solution.indeterminate_expected_indices).to include(0, 1)
          expect(maximizer.solution.indeterminate_actual_indices).to include(1, 2)
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
              result.unmatched_expected_indices == unmatched_expected &&
              result.unmatched_actual_indices   == unmatched_actual
          end

          failure_message do |result|
            if result.candidate_result?
              "expected a complete solution, but still had indeterminate indices: " +
                "expected: #{result.indeterminate_expected_indices.inspect}; " +
              "actual: #{result.indeterminate_actual_indices.inspect}"
            elsif result.unmatched_expected_indices != unmatched_expected
              "expected unmatched_expected_indices: #{unmatched_expected.inspect} " +
              "but got: #{result.unmatched_expected_indices.inspect}"
            elsif result.unmatched_actual_indices != unmatched_actual
              "expected unmatched_actual_indices: #{unmatched_actual.inspect} " +
              "but got: #{result.unmatched_actual_indices.inspect}"
            end
          end
        end

        it 'returns no unmatched indices when everything reciprocally matches one item' do
          maximizer = PairingsMaximizer.new({ 0 => [1], 1 => [0] },
                                            { 0 => [1], 1 => [0] })
          expect(maximizer.find_best_solution).to produce_result([], [])
        end

        it 'returns unmatched indices for everything that has no matches' do
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
