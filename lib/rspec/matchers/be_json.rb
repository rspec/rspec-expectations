require 'diff_matcher'
require 'json'

RSpec::Matchers.define :be_json_matching do |expected|
  match do |actual|
    @actual = JSON.parse(actual)
    @difference = DiffMatcher::Difference.new(expected, @actual)
    @difference.matches?
  end

  failure_message_for_should do
    @difference.details
  end
end

module RSpec
  module Matchers
    def be_json_matching(expected, opts={})
      Matcher.new :be_json_matching, expected do |_expected_|
        match do |actual|
          @actual = JSON.parse(actual)
          @difference = DiffMatcher::Difference.new(_expected_, @actual, opts)
          @difference.matching?
        end

        failure_message_for_should do
          @difference.to_s
        end
      end
    end
  end
end
