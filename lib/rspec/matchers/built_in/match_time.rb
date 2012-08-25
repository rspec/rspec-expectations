module RSpec
  module Matchers
    module BuiltIn
      class MatchTime < BaseMatcher
        def match(expected, actual)
          (seconds_of(expected) - seconds_of(actual)).abs < 1
        end

        def failure_message_for_should
          "expected #{actual} to be same time as #{expected} but it wasn't"
        end

        def failure_message_for_should_not
          "expected #{actual} not to be same time as #{expected} but it was"
        end

        def description
          "be same time as #{expected}"
        end

        private

        def seconds_of(time)
          time = time.to_time if time.respond_to?(:to_time)
          time.to_f
        end
      end
    end
  end
end
