require 'diff/lcs'
require 'diff/lcs/hunk'
require 'pp'

module RSpec
  module Expectations
    class Differ
      # This is snagged from diff/lcs/ldiff.rb (which is a commandline tool)
      def diff_as_string(data_new, data_old)
        data_old = data_old.split(/\n/).map! { |e| e.chomp }
        data_new = data_new.split(/\n/).map! { |e| e.chomp }
        diffs = Diff::LCS.diff(data_old, data_new)
        output = ""
        return output if diffs.empty?
        oldhunk = hunk = nil
        file_length_difference = 0
        diffs.each do |piece|
          begin
            hunk = Diff::LCS::Hunk.new(
              data_old, data_new, piece, context_lines, file_length_difference
            )
            file_length_difference = hunk.file_length_difference
            next unless oldhunk
            # Hunks may overlap, which is why we need to be careful when our
            # diff includes lines of context. Otherwise, we might print
            # redundant lines.
            if (context_lines > 0) and hunk.overlaps?(oldhunk)
              hunk.unshift(oldhunk)
            else
              output << oldhunk.diff(format)
            end
          ensure
            oldhunk = hunk
            output << "\n"
          end
        end
        #Handle the last remaining hunk
        output << oldhunk.diff(format) << "\n"
        color_diff output
      end

      def diff_as_object(actual, expected)
        actual_as_string = object_to_string(actual)
        expected_as_string = object_to_string(expected)
        diff = diff_as_string(actual_as_string, expected_as_string)

        if diff.empty?
          "#{actual}.==(#{expected}) returned false even though the diff " \
          "between #{actual} and #{expected} is empty. Check the " \
          "implementation of #{actual}.==."
        else
          color_diff diff
        end
      end

    protected

      def format
        :unified
      end

      def context_lines
        3
      end

      def color(text, code)
        "\e[#{code}m#{text}\e[0m"
      end

      def color_diff(diff)
        return diff unless RSpec::Matchers.configuration.color?

        red = 31
        green = 32
        blue = 34

        lines = diff.lines.map do |line|
          case line[0].chr
          when "+"
            color(line, green)
          when "-"
            color(line, red)
          when "@"
            line[1].chr == "@" ? color(line, blue) : line
          else
            line
          end
        end
        lines.join
      end

      def object_to_string(object)
        case object
        when Hash
          object.keys.sort_by { |k| k.to_s }.map do |k|
            %(#{PP.singleline_pp(k, "")} => #{PP.singleline_pp(object[k], "")})
          end.join(",\n")
        when String
          object =~ /\n/ ? object : object.inspect
        else
          PP.pp(object,"")
        end
      end
    end

  end
end

