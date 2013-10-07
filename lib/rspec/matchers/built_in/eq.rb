# encoding: UTF-8

module RSpec
  module Matchers
    module BuiltIn
      class Eq < BaseMatcher
        def match(expected, actual)
          actual == expected
        end

        def failure_message_for_should
          "\nexpected: #{format_object(expected)}\n     got: #{format_object(actual)}\n\n(compared using ==)\n"
        end

        def failure_message_for_should_not
          "\nexpected: value != #{format_object(expected)}\n     got: #{format_object(actual)}\n\n(compared using ==)\n"
        end

        def diffable?; true; end

      private

        def format_object(object)
          if object.is_a?(Time)
            "#{object.inspect} (+ #{"%06d" % object.usec} μs)"
          elsif defined?(DateTime) && object.is_a?(DateTime)
            microseconds = object.strftime("%6N")[0,6]
            "#{object.inspect} (+ #{microseconds} μs)"
          else
            object.inspect
          end
        end
      end
    end
  end
end

