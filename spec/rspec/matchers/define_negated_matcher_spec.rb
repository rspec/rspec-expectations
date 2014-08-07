module RSpec
  module Matchers

    describe 'define_negated_matcher' do

      RSpec::Matchers.define :be_odd_number do
        match { |actual| actual.odd? }
      end

      context 'when using the default negated description' do
        RSpec::Matchers.define_negated_matcher :be_an_even_number, :be_odd_number

        it 'uses the default negated description' do
          matcher = be_an_even_number
          expect(matcher.description).to eq("be an even number")
        end

        it 'negates the matcher' do
          expect(22).to be_an_even_number
        end
      end

      context 'when the negated description is overriden' do

        RSpec::Matchers.define :be_bigger_then_ten do
          match { |actual| actual > 10 }
        end

        RSpec::Matchers.define_negated_matcher :be_smaller_then_ten, :be_bigger_then_ten do |desc|
          "#{desc.sub('bigger', 'smaller')} (overriden)"
        end

        it 'overrides the description with the provided block' do
          matcher = be_smaller_then_ten
          expect(matcher.description).to eq("be smaller then ten (overriden)")
        end

        it 'negates the matcher' do
          expect(9).to be_smaller_then_ten
        end
      end

    end
  end
end

