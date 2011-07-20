module RSpec
  module Matchers
    class MatchHash
      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        @difference = Differ::Difference.new(@expected, actual)
        @difference.matches?
      end

      def failure_message_for_should
        @difference.details
      end
    end

    OperatorMatcher.register(Hash, '=~', RSpec::Matchers::MatchHash)

    def be_hash_matching(expected)
      Matcher.new :be_hash_matching, expected do |_expected_|
        match do |actual|
          @difference = Differ::Difference.new(_expected_, actual)
          @difference.matches?
        end

        failure_message_for_should do
          @difference.details
        end
      end
    end

    def be_hash_partially_matching(expected)
      Matcher.new :be_hash_partially_matching, expected do |_expected_|
        match do |actual|
          @difference = Differ::PartialDifference.new(_expected_, actual)
          @difference.matches?
        end

        failure_message_for_should do
          @difference.details
        end
      end
    end

    def be_hash_all_matching(expected)
      Matcher.new :be_hash_all_matching, expected do |_expected_|
        match do |actual|
          @difference = Differ::Difference.new(_expected_, actual, :show_all => true)
          @difference.matches?
        end

        failure_message_for_should do
          @difference.details
        end
      end
    end

    def be_hash_all_partially_matching(expected)
      Matcher.new :be_hash_all_partially_matching, expected do |_expected_|
        match do |actual|
          @difference = Differ::PartialDifference.new(_expected_, actual, :show_all => true)
          @difference.matches?
        end

        failure_message_for_should do
          @difference.details
        end
      end
    end

    module Differ
      class Difference
        def initialize(expected, actual, opts={})
          @show_all = opts[:show_all]
          @d = difference(expected, actual)
        end

        def matches?
          @match ||= @d ? item_types.map { |item_type|
            color_scheme[item_type]
          }.reduce(0) { |count, (color, prefix)|
            count + @d.scan("#{color}#{prefix}").size
          } == 0 : true
        end

        def details
          if @d
            msg = "\e[0m" + @d.split("\n").join("\n\e[0m")
            where = color_scheme_keys.collect { |item_type|
              color, prefix = color_scheme[item_type]
              count = msg.scan("#{color}#{prefix}").size
              "#{color}#{prefix} #{bold}#{count} #{item_type}#{reset}" if count > 0
            }.compact.join(", ")
            msg <<  "\nWhere, #{where}" if where.size > 0

            RSpec.configuration.color_enabled? ? msg : msg.gsub(/\e\[\d+m/, "")
          else
            "failed to match"
          end
        end

        def to_s
          @d && @d.gsub(/\e\[\d+m/, "")
        end

        private

        def item_types
          [:missing, :additional]
        end

        def item_types_shown
          ret = [:different] + item_types
          ret += [:additional] if @show_all
          ret.uniq
        end

        def matches_shown
          ret = []
          ret += [:match_class, :match_proc, :match_regexp] if @show_all
          ret
        end

        def difference(expected, actual, reverse=false)
          if actual.is_a? expected.class
            left = diff(expected, actual, true)
            right = diff(actual, expected)
            items_to_s(
              expected,
              (item_types_shown).reduce([]) { |a, method|
                a + send(method, left, right, expected.class).compact.map { |item| markup(method, item) }
              }
            )
          else
            difference_to_s(expected, actual, reverse)
          end
        end

        def diff(expected, actual, reverse=false)
          if expected.is_a?(Hash)
            expected.keys.reduce({}) { |h, k|
              h.update(k => actual.has_key?(k) ? difference(actual[k], expected[k], reverse) : expected[k])
            }
          elsif expected.is_a?(Array)
            expected, actual = [expected, actual].map { |x| x.each_with_index.reduce({}) { |h, (v, i)| h.update(i=>v) } }
            #diff(expected, actual, reverse)  # XXX - is there a test case for this?
            diff(expected, actual)
          else
            actual
          end if expected.is_a? actual.class
        end

        def compare(right, expected_class, default=nil)
          if [Hash, Array].include? expected_class
            right && right.keys.tap { |keys| keys.sort if expected_class == Array }.map { |k|
              yield k
            }
          else
            [default]
          end
        end

        def different(left, right, expected_class)
          compare(right, expected_class, difference_to_s(right, left)) { |k|
            "#{"#{k.inspect}=>" if expected_class == Hash}#{right[k]}" if right[k] and left.has_key?(k)
          }
       end
       
        def missing(left, right, expected_class)
          compare(left, expected_class) { |k|
            "#{"#{k.inspect}=>" if expected_class == Hash}#{left[k].inspect}" unless right.has_key?(k)
          }
       end

        def additional(left, right, expected_class)
          missing(right, left, expected_class)
        end

        def match?(expected, actual)
          case expected
            when Class ; [actual.is_a?(expected)                         , :match_class  ]
            when Proc  ; [expected.call(actual)                          , :match_proc   ]
            when Regexp; [actual.is_a?(String) && actual.match(expected) , :match_regexp ]
            else         [actual == expected                             , :match        ]
          end
        end

        def items_to_s(expected, items)
          case expected
            when Hash ; "{\n#{items.join(",\n")}\n}\n"
            when Array; "[\n#{items.join(",\n")}\n]\n"
            else items.join.strip
          end if items.size > 0
        end

        def match_regexp_to_s(expected, actual)
          if actual.is_a? String
            color, prefix = color_scheme[:match_regexp]
            actual.sub(expected, "#{color}(\e[1m#{actual[expected, 0]}#{reset}#{color})#{reset}")
          end
        end

        def match_to_s(expected, actual, match_type)
          actual = match_regexp_to_s(expected, actual) if match_type == :match_regexp
          markup(match_type, actual) if matches_shown.include? match_type
        end

        def difference_to_s(expected, actual, reverse=false)
          match, match_type = match? *(reverse ? [actual, expected] : [expected, actual])
          if match
            match_to_s(expected, actual, match_type)
          else
            "#{markup(:missing, expected.inspect)}#{markup(:additional, actual.inspect)}"
          end
        end

        def bold ; "\e[1m"; end
        def reset; "\e[0m"; end
        def color_scheme_keys
          [:missing, :additional, :match_regexp, :match_class, :match_proc]
        end
        def color_scheme
          {
            :missing       => ["\e[31m", "-"],
            :additional    => ["\e[32m", "+"],
            :match_regexp  => ["\e[33m", "~"],
            :match_class   => ["\e[34m", ":"],
            :match_proc    => ["\e[36m", "{"]
          }
        end

        def markup(item_type, item)
          if item_type == :different
            item.split("\n").map {|line| "  #{line}"}.join("\n") if item
          else
            color, prefix = color_scheme[item_type]
            "#{color}#{prefix+' ' if color}#{bold if color and item_type != :match_regexp}#{reset if item_type == :match_regexp}#{item}#{reset if color}" if item
          end if item
        end
      end

      class PartialDifference < Difference
        def item_types
          [:missing]
        end
      end
    end

  end
end


