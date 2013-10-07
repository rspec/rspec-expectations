# encoding: UTF-8

require 'date'

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
          case object
          when Time
            # This would be simpler as `object.to_f.round(6).to_s.split('.').last` but
            # 1.8.7 does not support `round(6)`, so this is the best we can do.
            # This can be changed to the above once we drop support for 1.8.7.
            microseconds = ("%10.6f" % object.to_f)[-6, 6]

            offset = "#{object.gmt_offset < 0 ? "-" : "+"}%02d%02d" % (object.gmt_offset/60).abs.divmod(60)
            object.strftime("%Y-%m-%d %H:%M:%S #{offset} (+ #{microseconds} μs)")
          when DateTime
            microseconds = object.strftime("%6N")[0,6]
            object.strftime("%Y-%m-%d %H:%M:%S %z (+ #{microseconds} μs)")
          else
            object.inspect
          end
        end
      end
    end
  end
end

