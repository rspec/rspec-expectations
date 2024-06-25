RSpec.describe 'match_pattern matcher' do
  it_behaves_like 'an RSpec value matcher', :valid_value => [1, 2, 3],
                                            :invalid_value => [1, 2, '3'] do
    let(:matcher) { match_pattern([Integer, Integer, Integer]) }
  end

  context 'when expected pattern matches with actual' do
    it 'passes' do
      expect([1, 2, 3]).to match_pattern([Integer, Integer, Integer])
    end
  end

  context 'when expected pattern does not match with actual' do
    it 'fails' do
      expect {
        expect([1, 2, 3]).to match_pattern([Integer, Integer, String])
      }.to fail_with('expected [1, 2, 3] to match pattern [Integer, Integer, String]')
    end
  end

  context 'when expected pattern cannot be used as pattern-matching' do
    it 'raises SyntaxError' do
      expect {
        expect([1, 2, 3]).to match_pattern(Object.new)
      }.to raise_error(SyntaxError, "The match_pattern matcher requires that the expected object can be used as Ruby's pattern-matching but a `SyntaxError` was raised instead.")
    end
  end

  context 'when pattern-matching is not supported on the current Ruby version' do
    before do
      stub_const('RUBY_VERSION', '2.7.0')
    end

    it 'raises NotImplementedError' do
      expect {
        expect([1, 2, 3]).to match_pattern([Integer, Integer, Integer])
      }.to raise_error(NotImplementedError, 'The match_pattern matcher is only supported on Ruby 3 or higher.')
    end
  end
end
