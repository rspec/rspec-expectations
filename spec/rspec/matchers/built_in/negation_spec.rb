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
    end

    context 'expect(...).to_not ~(matcher)' do
      it 'can pass' do
        expect('A').to_not ~eq('A')
      end
      it 'can pass' do
        expect('A').to_not !eq('A')
      end
    end

    context 'expect(...).to ~(matcher_1.and matcher_2)' do
      it 'can pass' do
        expect('A').to ~(eq('B').and eq('C'))
      end
      it 'can pass' do
        expect('A').to !(eq('B').and eq('C'))
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
