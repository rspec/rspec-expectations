module RSpec
  module Matchers
    module BuiltIn
      class Match < BaseMatcher
        def match(expected, actual)
          actual.match expected
        end

        def docstring_for_should
          "matches #{expected.inspect}"
        end

        def docstring_for_should_not
          "does not match #{expected.inspect}"
        end
      end
    end
  end
end
