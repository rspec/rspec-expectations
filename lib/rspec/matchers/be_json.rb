require 'json'

# XXX refactor - this has much repeated code from match_hash.rb
RSpec::Matchers.define :be_json_matching do |expected|
  match do |actual|
    @actual = JSON.parse(actual)
    @difference = Diff.diff(@actual, expected)
    @difference.match?
  end

  failure_message_for_should do
    @difference.details
  end
end

# XXX refactor - this has much repeated code from match_hash.rb
RSpec::Matchers.define :be_json_partially_matching do |expected|
  match do |actual|
    @actual = JSON.parse(actual)
    @difference = Diff.diff(@actual, expected)
    @difference.partial_match?
  end

  failure_message_for_should do
    @difference.details
  end
end
