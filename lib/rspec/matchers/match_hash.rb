require 'diff_matcher'

module RSpec
  module Matchers
    def be_hash_matching(expected, opts={})
      opts.update(:color_enabled=>RSpec.configuration.color_enabled?)

      Matcher.new :be_hash_matching, expected do |_expected_|
        match do |actual|
          @difference = DiffMatcher::Difference.new(_expected_, actual, opts)
          @difference.matching?
        end

        failure_message_for_should do
          @difference.to_s
        end
      end
    end
  end
end
