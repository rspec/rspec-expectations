module RSpec
  module Matchers
    class Cover
      include BaseMatcher

      def initialize(*expected)
        super(expected)
      end

      def matches?(range)
        expected.all? {|e| range.cover?(e)}
      end

      def does_not_match?(range)
        expected.none? {|e| range.cover?(e)}
      end
    end
  end
end
