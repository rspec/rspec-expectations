module RSpec::Expectations
  RSpec.describe AggregatedFailure do
    it 'is frozen by default' do
      failure = described_class.build('terrible failure')

      expect(failure).to be_frozen
    end

    it 'cannot be instantiated to be mutable' do
      expect { described_class.new('terrible failure') }.to raise_error(NoMethodError)
    end

    it 'has meaningful #inspect' do
      failure = described_class.build('terrible failure')

      expect(failure.inspect).to eq('AggregatedFailure: terrible failure')
    end
  end
end
