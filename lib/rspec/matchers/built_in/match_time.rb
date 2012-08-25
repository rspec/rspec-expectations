module RSpec
  module Matchers
    module BuiltIn
      class MatchTime < BaseMatcher
        def match(expected, actual)
          (expected - actual).abs < 1
        end

        def failure_message_for_should
          "expected #{format_time(actual)} to be same time as #{format_time(expected)} but it wasn't"
        end

        def failure_message_for_should_not
          "expected #{format_time(actual)} not to be same time as #{format_time(expected)} but it was"
        end

        def description
          "be same time as #{expected}"
        end

        private

        def format_time(time)
          time.strftime("%Y-%m-%d %H:%M:%S %z")
        end
      end
    end
  end
end
