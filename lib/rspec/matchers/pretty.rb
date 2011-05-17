module RSpec
  module Matchers
    module Pretty
      def split_words(sym)
        sym.to_s.gsub(/_/,' ')
      end

      def to_sentence(words)
        words = words.map{|w| w.inspect}
        case words.length
          when 0
            ""
          when 1
            " #{words[0]}"
          when 2
            " #{words[0]} and #{words[1]}"
          else
            " #{words[0...-1].join(', ')}, and #{words[-1]}"
        end
      end

      def to_indicative(infinitive)
        changed = false
        { /be/ => "is",
          /have/ => "has",
          /match/ => "matches"}.each_pair do |pattern, substitution|
          if infinitive =~ pattern
            infinitive.sub!(pattern, substitution)
            changed = true
          end
        end
        changed ? infinitive : infinitive.to_s + 's'
      end

      def _pretty_print(array)
        result = ""
        array.each_with_index do |item, index|
          if index < (array.length - 2)
            result << "#{item.inspect}, "
          elsif index < (array.length - 1)
            result << "#{item.inspect} and "
          else
            result << "#{item.inspect}"
          end
        end
        result
      end
    end
  end
end
