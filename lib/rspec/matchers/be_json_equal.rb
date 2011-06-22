require 'json'

RSpec::Matchers.define :be_json_equal do |expected|
  match do |actual|
    @actual = JSON.parse(actual)
    @difference = Diff.diff(@actual, expected)
    @difference.match?
  end

  failure_message_for_should do
    ENV['GET_FAILURE_MESSAGE'] ? @difference.to_s.inspect: @difference.to_s
  end
end
