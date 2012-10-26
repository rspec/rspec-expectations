module RSpec
  module Matchers
    module BuiltIn
      class MatchArray < BaseMatcher
        def match(expected, actual)
          return false unless actual.is_a? Array

          @extra_items = difference_between_arrays(actual, expected)
          @missing_items = difference_between_arrays(expected, actual)
          @extra_items.empty? & @missing_items.empty?
        end

        def failure_message_for_should
          if actual.is_a? Array
            message =  "expected collection contained:  #{safe_sort(expected).inspect}\n"
            message += "actual collection contained:    #{safe_sort(actual).inspect}\n"
            message += "the missing elements were:      #{safe_sort(@missing_items).inspect}\n" unless @missing_items.empty?
            message += "the extra elements were:        #{safe_sort(@extra_items).inspect}\n"   unless @extra_items.empty?
          else
            message = "expected an array, actual result was a #{actual.class}"
          end

          message
        end

        def failure_message_for_should_not
          "Matcher does not support should_not"
        end

        def description
          "contain exactly #{_pretty_print(expected)}"
        end

        private

        def safe_sort(array)
          array.sort rescue array
        end

        def difference_between_arrays(array_1, array_2)
          difference = array_1.dup
          array_2.each do |element|
            if index = difference.index(element)
              difference.delete_at(index)
            end
          end
          difference
        end
      end
    end
  end
end
