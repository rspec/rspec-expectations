module RSpec
  module Matchers
    class Match
      include BaseMatcher

      def matches?(actual)
        super(actual).match(expected)
      end
    end
  end
end
