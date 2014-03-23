module RSpec::Matchers::BuiltIn
  describe Negation do

    describe :description do
      it 'provides a description' do
        matcher = ~eq('A')
        matcher.matches?('A')
        expect(matcher.description).to eq 'not eq "A"'
      end
    end

    context 'expect(...).to ~(matcher)' do
      it 'can pass' do
        expect('A').to ~eq('B')
      end

      it 'can pass' do
        expect('A').to !eq('B')
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
      it 'can pass' do
        expect('A').to_not !eq('A')
      end
    end

    context 'expect(...).to (~matcher_1).and (~matcher_2)' do
      it 'can pass' do
        expect('A').to (~eq('B')).and (~eq('C'))
      end
      it 'can pass' do
        expect('A').to (!eq('B')).and (!eq('C'))
      end
    end

    context 'expect(...).to ~(~matcher)' do
      it 'can pass' do
        expect('A').to ~~eq('A')
      end
      it 'can pass' do
        expect('A').to !!eq('A')
      end
    end

  end
end