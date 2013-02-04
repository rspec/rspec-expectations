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
              if hunk.respond_to?(:merge)
                # diff-lcs 1.2.x
                hunk.merge(oldhunk)
              else
                # diff-lcs 1.1.3
                hunk.unshift(oldhunk)
              end
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
        if diff = diff_as_string(actual_as_string, expected_as_string)
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

      def color(text, color_code)
        "\e[#{color_code}m#{text}\e[0m"
      end

      def red(text)
        color(text, 31)
      end

      def green(text)
        color(text, 32)
      end

      def blue(text)
        color(text, 34)
      end

      def color_diff(diff)
        return diff unless RSpec::Matchers.configuration.color?

        diff.lines.map { |line|
          case line[0].chr
          when "+"
            green line
          when "-"
            red line
          when "@"
            line[1].chr == "@" ? blue(line) : line
          else
            line
          end
        }.join
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

