require 'term/ansicolor'

module RSpec
  module Matchers
    class MatchHash
      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        @difference = Diff.diff(actual, @expected)
        @difference.match?
      end

      def failure_message_for_should
        "#{"\e[0m" if RSpec.configuration.color_enabled?}" + @difference.to_s
      end
    end

    OperatorMatcher.register(Hash, '=~', RSpec::Matchers::MatchHash)

    def be_hash_matching(expected)
      Matcher.new :be_hash_matching, expected do |_expected_|
        match do |actual|
          @difference = Diff.diff(actual, _expected_)
          @difference.match?
        end

        failure_message_for_should do
          "#{"\e[0m" if RSpec.configuration.color_enabled?}" + @difference.to_s
        end
      end
    end

    def be_hash_partially_matching(expected)
      Matcher.new :be_hash_partially_matching, expected do |_expected_|
        match do |actual|
          @difference = Diff.diff(actual, _expected_)
          @difference.partial_match?
        end

        failure_message_for_should do
          "#{"\e[0m" if RSpec.configuration.color_enabled?}" + @difference.to_s
        end
      end
    end
  end
end

module Diff
  def self.diff expected, actual
    differ = case [expected.class, actual.class]
    when [Array, Array]; ArrayDiffer
    when [Hash , Hash ]; HashDiffer
    else DefaultDiffer
    end.new(expected, actual)
  end

  class BaseDiff
    include Term::ANSIColor
    attr_reader :expected, :actual

    def self.diff(expected, actual)
      new(expected, actual)
    end

    def initialize(expected, actual)
      @expected = expected
      @actual = actual
    end

    def match?
      expected == actual
    end

    def partial_match?
      match?
    end

    def indent(item)
      item.split("\n").map {|s| "  #{s}"}.join("\n")
    end

    def markup(item_type, item)
      bold = "\e[1m"
      reset = "\e[0m"
      (color, prefix) = case item_type
        when :matched   ; ["\e[33m", "~"]
        when :missing   ; ["\e[31m", "-"]
        when :additional; ["\e[32m", "+"]
      end
      RSpec.configuration.color_enabled?  ? "#{color}#{prefix} #{bold}#{item}#{reset}" : "#{prefix} #{item}"
    end
  end


  class HashDiffer < BaseDiff
    def match?
      diffed_wrong_values.size + missing_items.size + additional_items.size == 0
    end

    def partial_match?
      diffed_wrong_values(:partial_match?).size + missing_items.size == 0
    end

    def to_s
      "{\n" +
      (
        diffed_correct_values.map {|ck, cv| indent               "#{ck.inspect} => #{cv}"        } +
        diffed_wrong_values.map   {|wk, wv| indent               "#{wk.inspect} => #{wv}"        } +
        missing_items.map         {|mk, mv| markup :missing    , "#{mk.inspect} => #{mv.inspect}"} +
        additional_items.map      {|ak, av| markup :additional , "#{ak.inspect} => #{av.inspect}"}
      ).join(",\n") +
      "\n" +
      "}\n"
    end

    def missing_items
      Hash[actual.select {|k, v| !expected.keys.include? k}]
    end

    def additional_items
      Hash[expected.select {|k, v| !actual.keys.include? k}]
    end

    def diffed_correct_values
      _diffed_values(:match?, false)
    end

    def diffed_wrong_values(match_method = :match?)
      _diffed_values(match_method, true)
    end

    private

    def _diffed_values(match_method, not_match)
      actual.inject({}) {|h, (k, v)|
        diff = Diff.diff(expected[k], v)
        h[k] = diff if expected.keys.include?(k) && (not_match ? !diff.send(match_method) : diff.send(match_method))
        h
      }
    end
  end


  class ArrayDiffer < BaseDiff
    def match?
      # refactor this with pretty_items
      m = true
      actual.each_with_index do |item, index|
        if additional? index, item
          m = false
        elsif !(correct?(index, item))
          m = false
        end
      end
      if expected.size > actual.size
        expected.slice(actual.size..-1).each do |item|
          m = false
        end
      end
      m
    end

    def to_s
      "[" + pretty_items.join(", ") + "]"
    end

    private

    def pretty_items
      [].tap do |l|
        actual.each_with_index do |item, index|
          if additional? index, item
            l << markup(:missing, item.inspect)
          elsif correct? index, item
            l << item.inspect
          else
            l << Diff.diff(expected[index], item)
          end
        end
        if expected.size > actual.size
          expected.slice(actual.size..-1).each do |item|
            l << markup(:additional, item.inspect)
          end
        end
      end
    end

    def additional? index, value
      index >= expected.size
    end

    def correct? index, value
      Diff.diff(expected[index], value).match?
    end
  end


  class DefaultDiffer < BaseDiff
    def match?
      if actual.is_a?(Regexp)
        expected.is_a?(String) ? !!expected.match(actual) : !!expected.inspect.match(actual)
      elsif actual.is_a?(Proc)
        actual.call(expected)
      elsif actual.is_a?(Class)
        expected.is_a?(actual)
      else
        expected == actual
      end
    end

    def to_s
      # refactor
      match? ? expected_to_s : markup(:missing, @actual.inspect) + expected_to_s
    end

    def expected_to_s
      if match?
        @actual.is_a?(Regexp) ? markup(:matched, (@expected.is_a?(String) and not @expected.nil?) ? @expected.sub(@actual, "[#{@expected[@actual, 0]}]") : @expected.inspect) : @expected.inspect
      else
        markup(:additional, (@actual.is_a?(Regexp) and @actual.is_a?(String) and not @expected.nil?) ? @expected.sub(@actual, "[#{@expected[@actual, 0]}]") : @expected.inspect)
      end
    end
  end
end
