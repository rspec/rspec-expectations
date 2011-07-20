require 'json'

# XXX refactor - this has much repeated code from match_hash.rb
RSpec::Matchers.define :be_json_matching do |expected|
  match do |actual|
    @actual = JSON.parse(actual)
    @difference = Differ::Difference.new(expected, @actual)
    @difference.matches?
  end

  failure_message_for_should do
    @difference.details
  end
end

# XXX refactor - this has much repeated code from match_hash.rb
RSpec::Matchers.define :be_json_partially_matching do |expected|
  match do |actual|
    @actual = JSON.parse(actual)
    @difference = Differ::PartialDifference.new(expected, @actual)
    @difference.matches?
  end

  failure_message_for_should do
    @difference.details
  end
end
