require 'json'

RSpec::Matchers.define :be_json_matching do |expected|
  match do |actual|
    @actual = JSON.parse(actual)
    @difference = Diff.diff(@actual, expected)
    @difference.match?
  end

  failure_message_for_should do
    @difference.to_s
  end
end

RSpec::Matchers.define :be_json_including do |expected|
  match do |actual|
    @actual = JSON.parse(actual)
    @difference = Diff.diff(@actual, expected)
    @difference.include?
  end

  failure_message_for_should do
    "No match for #{expected}"
  end
end
