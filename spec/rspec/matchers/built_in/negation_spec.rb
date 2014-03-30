module RSpec::Matchers::BuiltIn
  describe Negation do

    def configured_matcher_boolean_operators(is_enabled)
      RSpec.configure do |config|
        config.expect_with :rspec do |c|
          c.enable_matcher_boolean_operators = is_enabled
        end
      end
    end

    before(:all) do
      configured_matcher_boolean_operators(true)
    end

    after(:all) do
      configured_matcher_boolean_operators(false)
    end

    describe :description do
      it 'provides a description' do
        matcher = ~eq('A')
        matcher.matches?('A')
        expect(matcher.description).to eq 'not eq "A"'
      end
    end

    describe 'failure message' do
      let(:inner_matcher) { eq('A') }

      it 'returns the matcher negated failure message' do
        inner_matcher.matches?('A')
        expect {
          expect('A').to ~inner_matcher
        }.to fail_with(inner_matcher.failure_message_when_negated)
      end

      context 'when negated' do
        it 'returns the matcher negated failure message' do
          inner_matcher.matches?('B')
          expect {
            expect('B').to_not ~inner_matcher
          }.to fail_with(inner_matcher.failure_message)
        end
      end
    end

    context 'expect(...).to ~(matcher)' do
      it 'can pass' do
        expect('A').to ~eq('B')
      end

      it 'can pass', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to !eq('B')
      end

      it 'can pass', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to not(eq('B'))
      end

      context 'when the matcher responds to :does_not_match?' do
        it 'can pass - with :does_not_match?' do
          actual = ['A', 'B']
          matcher = include('C')
          allow(matcher).to receive(:does_not_match?).with(actual).and_call_original
          expect(actual).to ~(matcher)
          expect(matcher).to have_received(:does_not_match?).with(actual)
        end
      end

      context 'when the matcher does not respond to :does_not_match?' do
        it 'can pass - with reverse of :match?' do
          actual = 'A'
          matcher = eq('B')
          allow(matcher).to receive(:matches?).with(actual).and_call_original
          expect(actual).to ~(matcher)
          expect(matcher).to have_received(:matches?).with(actual)
        end
      end
    end

    context 'expect(...).to_not ~(matcher)' do
      it 'can pass' do
        expect('A').to_not ~eq('A')
      end
      it 'can pass', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to_not !eq('A')
      end
      it 'can pass', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to_not not(eq('A'))
      end
    end

    context 'expect(...).to (~matcher_1).and (~matcher_2)' do
      it 'can pass' do
        expect('A').to (~eq('B')).and (~eq('C'))
      end
      it 'can pass', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to (!eq('B')).and (!eq('C'))
      end
      it 'can pass', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to (not(eq('B'))).and (not(eq('C')))
      end
    end

    context 'expect(...).to ~(~matcher)' do

      it 'can pass' do
        expect('A').to ~(~eq('A'))
      end

      it 'can pass', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to !!eq('A')
      end

      it 'can pass', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to not(not(eq('A')))
      end

      it 'returns the original matcher' do
        original_matcher = eq('A')
        double_negate_matcher = ~(~original_matcher)
        expect(original_matcher).to eq double_negate_matcher
      end
    end

  end
end
